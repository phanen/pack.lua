_:
	# trim it since pack.lua don't work well with comment sometimes
	# NOTE: stash your dotflie since it's just change file inplace...

	nvim --clean -l src/trim_comment.lua

	# no --clean, need rtp
	nvim -l src/pack.lua ~/.config/nvim/init.lua

	# trim comment before join
	nvim --clean -l src/trim_comment.lua init.bundle.lua
	nvim --clean init.bundle.lua '+norm ggVGJ' +wq
	# we can use luac btw...
	
	# mv init.bundle.lua ~/.config/nvim/init.lua
