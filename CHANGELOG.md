# Changelog

## [1.6.0](https://github.com/lelouvincx/nvim/compare/v1.5.2...v1.6.0) (2025-12-17)


### Features

* **bufferline:** add plugin ([9abcb80](https://github.com/lelouvincx/nvim/commit/9abcb80edbe0737282ae455fd2b57afc19a85b86))
* **copilot:** setup github copilot again as inline code completion and super tab for blink ([dac672e](https://github.com/lelouvincx/nvim/commit/dac672e16bb4e869aaea0fff359b791c80e4cc11))


### Bug Fixes

* **avante:** library name change: echasnovski/mini.pick to nvim-mini/mini.pick ([6c2eb9e](https://github.com/lelouvincx/nvim/commit/6c2eb9e3ca0182d0b11b8083512303d1b9ba9e41))
* **blink:** refactor code to be cleaner ([5f51de9](https://github.com/lelouvincx/nvim/commit/5f51de90ac5a41f790db402536f9d44a9cf2a22a))
* **claudecode:** remove redundant parts ([f883e1f](https://github.com/lelouvincx/nvim/commit/f883e1f561f7965d54f5972e64e87d4c99ae55b9))
* **colorscheme:** fix error bufferline ([bbee6f4](https://github.com/lelouvincx/nvim/commit/bbee6f4aa09aebc815b9c36ace9580af73c5439d))
* **colorscheme:** lock commit catppuccin ([210137f](https://github.com/lelouvincx/nvim/commit/210137fd062b276ec49fac99ef52ed4d5877a005))
* **copilot:** change ghost text of copilot to be more clean ([4d72894](https://github.com/lelouvincx/nvim/commit/4d72894d52bce8705d256afd2c0c7d449257d1ea))
* **neocodeium:** remove plugin (not use anymore), fallback to copilot ([f55ce02](https://github.com/lelouvincx/nvim/commit/f55ce0298fe56f33f70ce9606e38333b722bcd6d))
* **rainbow:** upgrade to new github repository ([59e01d5](https://github.com/lelouvincx/nvim/commit/59e01d52cf5910bbb930558c5c6b52fc36fefac9))

## [1.5.2](https://github.com/lelouvincx/nvim/compare/v1.5.1...v1.5.2) (2025-10-01)


### Bug Fixes

* **blink:** remove integration for dadbod (unused) and env (high risk) ([1c1fe64](https://github.com/lelouvincx/nvim/commit/1c1fe64e1a12543fe8d2acfdde169ba70492e9a8))

## [1.5.1](https://github.com/lelouvincx/nvim/compare/v1.5.0...v1.5.1) (2025-08-01)


### Bug Fixes

* **claudecode:** remove option mcp_config_path, use direct link instead ([171d305](https://github.com/lelouvincx/nvim/commit/171d3051a1302a32bd420b06a943bed8885573ee))
* **colorschema:** use catppuccin latte ([e6c553f](https://github.com/lelouvincx/nvim/commit/e6c553fb12eaed4ba2466b015e2f094c29588e4f))

## [1.5.0](https://github.com/lelouvincx/nvim/compare/v1.4.0...v1.5.0) (2025-07-01)


### Features

* **claudecode:** Add claude code integration ([#11](https://github.com/lelouvincx/nvim/issues/11)) ([91f0f58](https://github.com/lelouvincx/nvim/commit/91f0f588944f8bbdd0a92c621f4da721add9ed28))
* **claudecode:** add Claude Code integration plugin ([30ec67e](https://github.com/lelouvincx/nvim/commit/30ec67e670afb6784ea290a85d96e46a03550d1a))
* **neocodeium:** add new plugin for AI inline-completion ([16742cd](https://github.com/lelouvincx/nvim/commit/16742cd22f620ab8d8a8f822c74579b785a9f87d))


### Bug Fixes

* **avante:** default provider to openai ([3201a09](https://github.com/lelouvincx/nvim/commit/3201a095feb56b0818c366c8a5e4145ab83c47d3))
* **avante:** update config to match with new releass ([eb0fa35](https://github.com/lelouvincx/nvim/commit/eb0fa35e4e33f5ea28ef48f6879477cc9c641180))
* **blink:** correct build version ([58501e4](https://github.com/lelouvincx/nvim/commit/58501e4eef54820c67b5fbe2add6d013a37c50f3))
* **options:** config ai selection between avante and claudecode (prefer claudecode) ([50a3c0b](https://github.com/lelouvincx/nvim/commit/50a3c0b5c277b13a1b0d00648c4e5e5948ebca3a))
* **options:** rename copilot_chat to ai_chat ([d327b6f](https://github.com/lelouvincx/nvim/commit/d327b6f30d2a7f3222feba663b5281859904f850))
* **supermaven:** remove supermaven from plugins ([b9e31c1](https://github.com/lelouvincx/nvim/commit/b9e31c18f69ea103a8e2751a2142b102761a6f5a))

## [1.4.0](https://github.com/lelouvincx/nvim/compare/v1.3.3...v1.4.0) (2025-06-01)


### Features

* **avante:** initialize plugin avante - for cursor-like AI chat ([f9b6262](https://github.com/lelouvincx/nvim/commit/f9b6262e09585e6ef7e24b60c0f26f3db11f0b67))
* **lspconfig:** add nvim-navbuddy for better navigation ([80243ad](https://github.com/lelouvincx/nvim/commit/80243ad639f497543a378752ba3358c9e3694265))

## [1.3.3](https://github.com/lelouvincx/nvim/compare/v1.3.2...v1.3.3) (2025-05-01)


### Bug Fixes

* **blink:** remove rust build ([4b207bc](https://github.com/lelouvincx/nvim/commit/4b207bcd859a2e95f1b6147ec7a44fd8af5fdcf4))

## [1.3.2](https://github.com/lelouvincx/nvim/compare/v1.3.1...v1.3.2) (2025-04-19)


### Bug Fixes

* **release:** release-please version 4.2.0 ([4f6b1c0](https://github.com/lelouvincx/nvim/commit/4f6b1c0f75818bd277863ab7ce2c2cba7091d96d))

## [1.3.1](https://github.com/lelouvincx/nvim/compare/v1.3.0...v1.3.1) (2025-04-19)


### Bug Fixes

* **release:** remove 'v' in tags ([8ac0d3e](https://github.com/lelouvincx/nvim/commit/8ac0d3ec76bd8bfce45f39a40cd0a00d8664ee27))
* **release:** remove job tagging ([e1f32a6](https://github.com/lelouvincx/nvim/commit/e1f32a625cbc3bf47ef7dc88e92036816fe722fa))
* update CI_TOKEN for all workflows ([924d2b2](https://github.com/lelouvincx/nvim/commit/924d2b2c87f73829d825873c6ccb2d10ce0dd193))

## [1.3.0](https://github.com/lelouvincx/nvim/compare/v1.2.0...v1.3.0) (2025-04-19)


### Features

* add optional flag to various plugins ([3ccd884](https://github.com/lelouvincx/nvim/commit/3ccd884ab491fcb21649132fda3c3bf484632c5b))
* **blink:** update more sources for blink to complete ([8d63dbd](https://github.com/lelouvincx/nvim/commit/8d63dbd9c3bee5f8b444aa990edc46240f9bbe0a))
* **ci:** add tag-stable-versions job for main merges ([ace17d8](https://github.com/lelouvincx/nvim/commit/ace17d85aa5763c1a66501dd1fbf03f8144e47b3))
* **copilot-chat:** add stream option and capitalize prompts ([f35b4d0](https://github.com/lelouvincx/nvim/commit/f35b4d0392bd4d5b4627f520a3723fc5d5b29324))
* **copilot:** update completion model to gpt-4o-copilot ([9c9b0d2](https://github.com/lelouvincx/nvim/commit/9c9b0d204f29469a3b439db7d68f093abd436ca0))
* **supermaven:** add plugin supermaven replace for copilot ([cedaa9f](https://github.com/lelouvincx/nvim/commit/cedaa9f78e350b4b47ff4710ee1e36d588d56d67))


### Bug Fixes

* **blink:** add option to use blink as default instead of nvim-cmp ([6cd06c5](https://github.com/lelouvincx/nvim/commit/6cd06c5f188e8eba1f88b9c3c9961cb5c5aafb96))
* **blink:** update config to use blink_enabled flag ([b9aeed7](https://github.com/lelouvincx/nvim/commit/b9aeed7d916467a8129e7f70a5e93bee56108305))
* **blink:** update providers order to match ([0d80227](https://github.com/lelouvincx/nvim/commit/0d8022754760d18f4958b4d42f0585466dc22079))
* **blink:** use additional icons from lazyvim besides default ([6e1c08b](https://github.com/lelouvincx/nvim/commit/6e1c08ba48d0b34681e3b06fe92d10e81a7d6f5d))
* **colorscheme:** remove default config for integrations ([f365ced](https://github.com/lelouvincx/nvim/commit/f365cedae6a8305733b4624ae726c2b156e4cfa2))
* **colorscheme:** remove nightfox colorscheme ([d2752cd](https://github.com/lelouvincx/nvim/commit/d2752cdaf46855c72e22301e6d2e65d747714f54))
* **copilot-chat:** change coding model to gpt-4.1 ([444f293](https://github.com/lelouvincx/nvim/commit/444f29338932a3a2c86a41505a0ecfe6f0198ca6))
* **lazy:** remove git from default lang ([aa01b7f](https://github.com/lelouvincx/nvim/commit/aa01b7fb37204a4ded5bdb9de144769b5a9a935f))
* **lspconfig:** remove djtls (java) ([d0329f6](https://github.com/lelouvincx/nvim/commit/d0329f6f4f33640b3a2972f5503d565270de4dba))
* **neo-tree:** show dotfiles by default ([fb8ce28](https://github.com/lelouvincx/nvim/commit/fb8ce2863832ed853132e6e15e878c25367f48c5))
* **noice:** update to ignore method textDocument/documentHighlight from lsp-config ([9edb599](https://github.com/lelouvincx/nvim/commit/9edb599c5d10e7a4c7fb9e130664498c02c68cae))
* **nvim-cmp:** add enable option ([bd586cc](https://github.com/lelouvincx/nvim/commit/bd586ccca65f29378c7728b49d0eb95059c5fa79))
* remove configuration for java ([f131966](https://github.com/lelouvincx/nvim/commit/f131966ab91e4bec06573b7809170725d260c3b6))
* **supermaven:** correct option vim.g.ai_cmp ([e1cc868](https://github.com/lelouvincx/nvim/commit/e1cc8683bac3d70d0ce04c078e9f895065ce4707))

## [1.2.0](https://github.com/lelouvincx/nvim/compare/v1.1.0...v1.2.0) (2025-03-09)


### Features

* **copilot-chat:** add markdown renderer config and misc config ([042b05e](https://github.com/lelouvincx/nvim/commit/042b05ee1fc8ba206e102adf1feebf9ec98f3c34))
* **copilot-chat:** bump model from o3-mini to claude-3.7-sonnet ([1107f19](https://github.com/lelouvincx/nvim/commit/1107f1974afecf0c870c77211ca3d15de106905e))
* **copilot-chat:** update the LLM model from claude-3.5-sonnet to o3-mini ([38a0e63](https://github.com/lelouvincx/nvim/commit/38a0e63ad8d27631311fbdc79bcc9ac8a0dfbd01))
* **filetype:** add filetype for envrc ([6d90e31](https://github.com/lelouvincx/nvim/commit/6d90e3113943d51f53e0463c723fc98456e368c5))
* **formatter:** remove black as python formatter because now I use ruff ([cca3519](https://github.com/lelouvincx/nvim/commit/cca3519004172971342975b70f965965e03ad9ad))
* **lazyvim:** bump lazyvim to version 8 ([915917f](https://github.com/lelouvincx/nvim/commit/915917f10d2add409d20334de03958f7a47049d3))


### Bug Fixes

* **blink:** correct blink config cmdline ([0cb156f](https://github.com/lelouvincx/nvim/commit/0cb156f1395b8e55b547106ba3c5f6dac2d27da1))

## [1.1.0](https://github.com/lelouvincx/nvim/compare/v1.0.0...v1.1.0) (2025-01-12)


### Features

* **action:** add schedule every month ([4092746](https://github.com/lelouvincx/nvim/commit/4092746cfff5469f68b88572658531303674c251))
* **action:** update tagging for the release action ([22b868c](https://github.com/lelouvincx/nvim/commit/22b868caa003a08b5f3e60d0b2998e248b84681d))
* **copilot:** update option to enable/disable copilot ([461b35e](https://github.com/lelouvincx/nvim/commit/461b35e7d9d16a3d74bc1aeede2a80e73b221afd))
* **filetype:** update filetype config for dbml ([d3e5560](https://github.com/lelouvincx/nvim/commit/d3e55603948d714b19a18a6b16a48e5225720ff0))
* **filetype:** update filetype config for env to detect as sh ([ccf1d01](https://github.com/lelouvincx/nvim/commit/ccf1d0126a74b12f77604356a1ff632ff250aa70))
* **release:** add semantic release ci workflow ([4026c11](https://github.com/lelouvincx/nvim/commit/4026c11ccd6fc72e12b888fb5b0c0fee7dbfc62e))


### Bug Fixes

* **action:** add permission to write for the action ([98a5159](https://github.com/lelouvincx/nvim/commit/98a515966d6cea979cedbc03282c97451b97972c))
* **action:** change to use ci token with more permissions ([516edc8](https://github.com/lelouvincx/nvim/commit/516edc8fb0a946df83d4764c337881c516e4f42d))
* **action:** fix authorization for action job ([04bbaf9](https://github.com/lelouvincx/nvim/commit/04bbaf9c552121cc701fa38548e436f703a7be85))
* **action:** remove option include-component-in-tag ([47ed742](https://github.com/lelouvincx/nvim/commit/47ed7423ca065d25bf2123ae0376d602419d2f1a))
