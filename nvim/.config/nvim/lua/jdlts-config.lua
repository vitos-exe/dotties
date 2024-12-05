local home_dir = os.getenv('HOME')

local is_file_exist = function(path)
    local f = io.open(path, 'r')
    return f ~= nil and io.close(f)
end

local fn = vim.fn

local get_lombok_javaagent = function()
    local lombok_dir = home_dir .. '/.m2/repository/org/projectlombok/lombok/'
    local lombok_versions = io.popen('ls -1 "' .. lombok_dir .. '" | sort -r')
    if lombok_versions ~= nil then
        local lb_i, lb_versions = 0, {}
        for lb_version in lombok_versions:lines() do
            lb_i = lb_i + 1
            lb_versions[lb_i] = lb_version
        end
        lombok_versions:close()
        if next(lb_versions) ~= nil then
            local lombok_jar = fn.expand(string.format('%s%s/lombok-%s.jar', lombok_dir, lb_versions[1], lb_versions[1]))
            if is_file_exist(lombok_jar) then
                return string.format('--jvm-arg=-javaagent:%s', lombok_jar)
            end
        end
    end
    return ''
end

local project_name = fn.fnamemodify(fn.getcwd(), ':p:h:t')
local workspace_dir = home_dir .. "/.cache/jdtls/workspace/" .. project_name

local get_jdp_javaagent = function()
    local jdp_dir = home_dir .. '/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/'
    local jdp_versions = io.popen('ls -1 "' .. jdp_dir .. '" | sort -r')
    if jdp_versions ~= nil then
        local lb_i, lb_versions = 0, {}
        for lb_version in jdp_versions:lines() do
            lb_i = lb_i + 1
            lb_versions[lb_i] = lb_version
        end
        jdp_versions:close()
        if next(lb_versions) ~= nil then
            local jdp_jar = fn.expand(string.format('%s/%s', jdp_dir, lb_versions[1]))
            if is_file_exist(jdp_jar) then
                return jdp_jar
            end
        end
    end
    return ''
end

local config = {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    on_attach = function()
        require("jdtls.setup").add_commands()
        require('jdtls.dap').setup_dap_main_class_configs()
    end,
    cmd = {
        'jdtls',
        '-config',
        home_dir .. '/.cache/jdtls/config',
        '-data',
        workspace_dir,
        get_lombok_javaagent(),
    },
    root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),
    settings = {
        java = {
            format = {
                comments = {
                    enabled = false,
                },
                settings = {
                    url =
                    "https://gist.githubusercontent.com/ikws4/7880fdcb4e3bf4a38999a628d287b1ab/raw/9005c451ed1ff629679d6100e22d63acc805e170/jdtls-formatter-style.xml",
                },
            },
        },
    },
    init_options = {
        bundles = {
            vim.fn.glob(get_jdp_javaagent(), 1)
        },
    },
}

require("jdtls").start_or_attach(config)

