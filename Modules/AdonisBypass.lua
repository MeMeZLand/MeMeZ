local BypassManager = {
    Hooks = {},
    FlagFunction = nil,
    TerminateFunction = nil,
    IsVerbose = true,
}

local StatusTracker = {
    DetectionDisabled = false,
    KillBlocked = false,
    DebugInfoIntercepted = false,
}

local function wrapFunction(target, handler)
    local success, result = pcall(function()
        return hookfunction(target, newcclosure(handler))
    end)
    return success and result
end

local function activateBypass()
    local currentThread = 2
    setthreadidentity(currentThread)

    local collected = getgc(true)
    for _, item in ipairs(collected) do
        if typeof(item) == 'table' then
            local detectionMethod = rawget(item, 'Detected')
            local killMethod = rawget(item, 'Kill')

            if
                typeof(detectionMethod) == 'function'
                and not BypassManager.FlagFunction
            then
                BypassManager.FlagFunction = detectionMethod
                wrapFunction(
                    detectionMethod,
                    function(trigger, details, preventCrash)
                        if trigger ~= '_' and BypassManager.IsVerbose then
                            warn(
                                'Adonis检测到了',
                                trigger,
                                '详细::',
                                details
                            )
                        end
                        if string.find(details, "Tamper") then
                            warn("傻逼adonis检测到了Tamper！！！")
                            return task.wait(9e9)
                        else
                            return true
                        end
                    end
                )
                table.insert(BypassManager.Hooks, detectionMethod)
                StatusTracker.DetectionDisabled = true
            end

            if
                typeof(killMethod) == 'function'
                and rawget(item, 'Variables')
                and rawget(item, 'Process')
                and not BypassManager.TerminateFunction
            then
                BypassManager.TerminateFunction = killMethod
                wrapFunction(killMethod, function(cause)
                    if BypassManager.IsVerbose then
                        warn('Adonis尝试踢出您, 原因: ', cause)
                    end
                    return nil
                end)
                table.insert(BypassManager.Hooks, killMethod)
                StatusTracker.KillBlocked = true
            end
        end
    end
    local Returned
    Returned = hookfunction(
        getrenv().debug.info,
        newcclosure(function(...)
            local LevelOrFunc, Info = ...
            if
                BypassManager.FlagFunction
                and LevelOrFunc == BypassManager.FlagFunction
            then
                if BypassManager.IsVerbose then
                    warn('😨')
                end
                return coroutine.yield(coroutine.running())
            end
            return Returned(...)
        end)
    )

    StatusTracker.DebugInfoIntercepted = true

    local resetThread = 7
    setthreadidentity(resetThread)
end

activateBypass()

print(
    string.format(
        '[Adonis绕过状态] 关闭检测: %s | 检测击杀玩家防御: %s | Debug 信息钩子: %s',
        tostring(StatusTracker.DetectionDisabled),
        tostring(StatusTracker.KillBlocked),
        tostring(StatusTracker.DebugInfoIntercepted)
    )
)
