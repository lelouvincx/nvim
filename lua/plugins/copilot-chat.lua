-- Registers copilot-chat filetype for markdown rendering
require("render-markdown").setup({
    file_types = { "markdown", "copilot-chat" },
})

return {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    cmd = "CopilotChat",
    opts = function()
        local user = vim.env.USER or "User"
        user = user:sub(1, 1):upper() .. user:sub(2)
        return {
            model = "claude-3.7-sonnet",
            agent = "copilot",
            context = nil, -- Default context or array of contexts to use (can be specified manually in prompt via #).
            sticky = nil, -- Default sticky prompt or array of sticky prompts to use at start of every new chat.

            temperature = 0.1,
            headless = false, -- Do not write to chat buffer and use history(useful for using callback for custom processing)
            callback = nil, -- Callback to use when ask response is received

            question_header = "  " .. user .. " ", -- Header to use for user questions
            answer_header = "  Copilot", -- Header to use for AI answers
            error_header = "> [!ERROR] Error",
            separator = "", -- Separator to use in chat

            window = {
                layout = "vertical", -- 'vertical', 'horizontal', 'float', 'replace'
                width = 0.4, -- fractional width of parent, or absolute width in columns when > 1
                height = 1, -- fractional height of parent, or absolute height in rows when > 1
                -- Options below only apply to floating windows
                relative = "cursor", -- 'editor', 'win', 'cursor', 'mouse'
                border = "rounded", -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
                row = nil, -- row position of the window, default is centered
                col = nil, -- column position of the window, default is centered
                title = "Copilot Chat", -- title of chat window
                footer = nil, -- footer of chat window
                zindex = 1, -- determines if window is on top or below other floating windows
            },

            show_help = true, -- Shows help message as virtual lines when waiting for user input
            show_folds = true, -- Shows folds for sections in chat
            highlight_selection = true, -- Highlight selection
            highlight_headers = false, -- Highlight headers in chat, disable if using markdown renderers (like render-markdown.nvim)
            auto_follow_cursor = false, -- Auto-follow cursor in chat
            auto_insert_mode = false,
            insert_at_end = true, -- Move cursor to end of buffer when inserting text
            clear_chat_on_new_prompt = false, -- Clears chat on every new prompt

            -- Custom prompts
            prompts = {
                explain = {
                    prompt = "> /COPILOT_EXPLAIN\n> #buffer\n\nThink step by step. Can you explain the following part of the code in detail?\nSpecifically:\n1. What is the purpose of this section?\n2. How does it work step-by-step?\n3. Are there any potential issues or limitations with this approach?",
                },
                review = {
                    prompt = "> /COPILOT_REVIEW\n> #buffers\n\nPlease review the following code. Consider following criterias:\n1. Code quality and adherence to best practices\n2. Potential bugs or edge cases\n3. Performance optimizations\n4. Readability and maintainability\n5. Any security concerns\nSuggest improvements and explain your reasoning for each suggestion.",
                },
                fix = {
                    prompt = "> /COPILOT_GENERATE\n> #buffer\n\nThere is a problem in this code. Rewrite the code to show it with the bug fixed.",
                },
                optimize = {
                    prompt = "> /COPILOT_GENERATE\n> #buffer\n\nHere's a piece of code that needs optimization. Please suggest optimizations to improve its performance. For each suggestion, explain the expected improvement and any trade-offs.",
                },
                optimizesql = {
                    prompt = "> /COPILOT_GENERATE\n> #buffer\n\nI need to optimize the following SQL query.\nThe query is currently taking too long to execute on large datasets. Please:\n1. Analyze the query and identify potential performance issues.\n2. Suggest optimizations, which may include:\n- Rewriting the query\n- Adding or modifying indexes\n- Suggestions for schema changes if necessary\n3. Explain the reasoning behind each optimization.\n4. If possible, provide an estimate of the performance improvement we might expect.\nAdditional context:\n- Database system: {database_system}\n- Approximate table sizes: {table_size}\n- Any relevant hardware constraints. It is your job to ask me about the database_system and table_size. Is it understood?",
                },
                docstring = {
                    prompt = "> /COPILOT_GENERATE\n> #buffer\n\nGenerate appropriate comments and docstrings for the following code.\n\nFollow conventions for docstrings. Include:\n1. Brief description of the function/class\n2. Parameters and their types\n3. Return value and type\n4. Any exceptions that might be raised\n5. Usage examples if the function/class usage is not immediately obvious\n\nPlease use clear, concise language and include relevant code snippets where appropriate.",
                },
                tests = {
                    prompt = "> /COPILOT_GENERATE\n> #buffer\n\nGenerate unit tests for the following code snippet. Include tests for:\n1. Normal expected inputs\n2. Edge cases\n3. Invalid inputs",
                },
                commit = {
                    prompt = "> #git:staged\n\nWrite commit message for the change with commitizen convention. Make sure the title does not exceed 50 characters. Wrap the whole message in code block with language gitcommit.",
                },
                implement = {
                    prompt = "> /COPILOT_GENERATE\n> #buffer\n\nThink step by step. Based on what I have provided, I need to implement a specific functionality in. It's your task to ask me about the functionality, programming language, and key requirements.\n\nPlease consider:\n- Error handling\n- Edge cases\n- Performance optimization\nBest practices\nPlease do not unnecessarily remove any comments or code.\nGenerate the code with clear comments explaining the logic.",
                },
            },
        }
    end,
    config = function(_, opts)
        local chat = require("CopilotChat")

        vim.api.nvim_create_autocmd("BufEnter", {
            pattern = "copilot-chat",
            callback = function()
                vim.opt_local.relativenumber = true
                vim.opt_local.number = true
            end,
        })

        chat.setup(opts)
    end,
}
