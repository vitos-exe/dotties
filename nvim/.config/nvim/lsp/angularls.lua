return {
    cmd = {"ngserver", "--stdio", "--tsProbeLocations", "../..,?/node_modules" , "--ngProbeLocations", "../../@angular/language-server/node_modules,?/node_modules/@angular/language-server/node_modules"},
    filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular" },
    root_markers = { "angular.json", "nx.json" }
}