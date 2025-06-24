return {
	cmd = {
		"ngserver",
		"--stdio",
		"--tsProbeLocations",
		"/usr/local/lib/node_modules/typescript/lib",
		"--ngProbeLocations",
		"/usr/local/lib/node_modules/@angular/language-server/bin",
		"--forceStrictTemplates",
		"--includeCompletionsWithSnippetText"
	},
	filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular" },
	root_markers = { "angular.json", "nx.json" }
}

