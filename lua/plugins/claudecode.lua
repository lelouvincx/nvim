return {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    version = false, -- Never set this value to "*"! Never!
    enabled = (vim.g.ai_chat == "claudecode"),
    opts = {
        -- INFO: custom claude command, add --mcp-config to use configured MCP servers
        terminal_cmd = "claude --mcp-config /Users/${USER}/Library/Application\\ Support/Claude/claude_code_config.json",
    },
}
