return {
	{
		'FluxxField/bionic-reading.nvim',
		config = function()
			require('bionic-reading').setup({
				auto_highlight = true,
				file_types = {
					["text"] = "any",
					["lua"] = {
						"comment"
					},
					["cs"] = {
						"comment"
					},
					["go"] = {
						"comment"
					}
				}
			})
		end,
	}
}
