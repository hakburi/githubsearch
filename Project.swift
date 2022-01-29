import ProjectDescription

let projectName: String = "GithubSearch"
let organizationName: String = "GenithLabs"
let bundleName: String = "com.genithlabs"

let projectSettings = Settings.settings(
  configurations: [
    .debug(name: "Debug", xcconfig: Path("Configs/Project-Debug.xcconfig")),
    .release(name: "Release", xcconfig: Path("Configs/Project-Release.xcconfig"))
  ]
)
let targetSettings = Settings.settings(
  configurations: [
    .debug(name: "Debug", xcconfig: Path("Configs/GithubSearch-Debug.xcconfig")),
    .release(name: "Release", xcconfig: Path("Configs/GithubSearch-Release.xcconfig"))
  ]
)

let project = Project(
  name: projectName,
  organizationName: organizationName,
  settings: projectSettings,
  targets: [
    Target(
      name: projectName,
      platform: .iOS,
      product: .app,
      bundleId: "com.genithlabs.\(projectName)",
      infoPlist: "Project/\(projectName)/Supporting Files/Info.plist",
      sources: ["Project/\(projectName)/Sources/**"],
      resources: ["Project/\(projectName)/Resources/**"],
      dependencies: [],
      settings: targetSettings
    )
  ]
)
