local status_ok, jdtls = pcall(require, 'jdtls')
if not status_ok then
    return
end

local jdtls_path = vim.fn.stdpath 'data' .. '/mason/packages/jdtls/'
local install_path =
    require('mason-registry').get_package('jdtls'):get_install_path()
local equinox_version = '1.6.400.v20210924-0641'

WORKSPACE_PATH = vim.fn.stdpath 'data' .. '/workspace/'
if vim.fn.has 'mac' == 1 then
    OS_NAME = 'mac'
elseif vim.fn.has 'unix' == 1 then
    OS_NAME = 'linux'
elseif vim.fn.has 'win32' == 1 then
    OS_NAME = 'win'
else
    vim.notify('Unsupported OS', vim.log.levels.WARN, { title = 'Jdtls' })
end

local root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local workspace_dir = WORKSPACE_PATH .. project_name

local extended_client_capabilites = require('jdtls').extendedClientCapabilities

local config = {
    cmd = {
        -- 💀
        'java', -- or '/path/to/java17_or_newer/bin/java'
        -- depends on if `java` is in your $PATH env variable and if it points to the right version.

        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-javaagent:' .. install_path .. '/lombok.jar',
        '-Xms1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens',
        'java.base/java.util=ALL-UNNAMED',
        '--add-opens',
        'java.base/java.lang=ALL-UNNAMED',
        -- 💀
        '-jar',
        jdtls_path
            .. 'plugins/org.eclipse.equinox.launcher_'
            .. equinox_version
            .. '.jar',
        -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
        -- Must point to the                                                     Change this to
        -- eclipse.jdt.ls installation                                           the actual version
        -- 💀
        '-configuration',
        jdtls_path .. 'config_' .. OS_NAME,
        -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
        -- Must point to the                      Change to one of `linux`, `win` or `mac`
        -- eclipse.jdt.ls installation            Depending on your system.

        '-data',
        workspace_dir,
    },
    on_attach = require('core.lsp').on_attach,
    capabilities = require('core.lsp').capabilities,

    -- 💀
    -- This is the default if not provided, you can remove it. Or adjust as needed.
    -- One dedicated LSP server & client will be started per unique root_dir
    root_dir = require('jdtls.setup').find_root(root_markers),

    settings = {
        java = {
            format = {
                enabled = false,
            },
            signatureHelp = { enabled = true },
            contentProvider = { preferred = 'fernflower' },
            completion = {
                guessMethodArguments = false,
                favoriteStaticMembers = {
                    'org.hamcrest.MatcherAssert.assertThat',
                    'org.hamcrest.Matchers.*',
                    'org.hamcrest.CoreMatchers.*',
                    'org.junit.jupiter.api.Assertions.*',
                    'java.util.Objects.requireNonNull',
                    'java.util.Objects.requireNonNullElse',
                    'org.mockito.Mockito.*',
                },
                filteredTypes = {
                    'com.sun.*',
                    'io.micrometer.shaded.*',
                    'java.awt.*',
                    'jdk.*',
                    'sun.*',
                },
            },
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
            codeGeneration = {
                toString = {
                    template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}',
                },
                hashCodeEquals = {
                    useJava7Objects = true,
                },
                useBlocks = true,
            },
        },
    },

    -- Language server `initializationOptions`
    -- You need to extend the `bundles` with paths to jar files
    -- if you want to use additional eclipse.jdt.ls plugins.
    --
    -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
    --
    -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
    init_options = {
        bundles = {},
        extendedClientCapabilities = extended_client_capabilites,
    },
    handlers = {
        ['language/status'] = function() end,
    },
}

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
jdtls.start_or_attach(config)

require('which-key').register {
    ['<leader>j'] = { name = 'Java' },
}
