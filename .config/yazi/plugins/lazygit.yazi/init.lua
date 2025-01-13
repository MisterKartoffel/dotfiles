local notify = function(cmd, msg, level)
    ya.notify({ title = cmd, content = msg, level = level, timeout = 5 })
end

return {
    entry = function(_, job)
        local repo = job.args[1]
        local cmd = "git"
        local args = {}

        if repo == "bare" then
            table.insert(args, "--work-tree=/home/felipe")
            table.insert(args, "--git-dir=/home/felipe/Dotfiles")
        end

        table.insert(args, "status")

        local output, err = Command(cmd)
            :args(args)
            :stderr(Command.PIPED)
            :output()

        if output.stderr ~= "" then
            notify(cmd, "Not in a git directory", "warn")
        else
            permit = ya.hide()
            cmd = "lazygit"

            if repo == "bare" then
                table.remove(args, 3)
            end

            output, err = Command(cmd)
                :args(args)
                :stderr(Command.PIPED)
                :output()

            if err ~= nil then
                notify("Failed to run " .. output, "Status: " .. err, "error")
            elseif not output.status.success then
                notify("Lazygit failed, exit code " .. output.status.code, output.stderr, "error")
            end
        end
    end,
}
