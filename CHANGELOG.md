# Changelog

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
