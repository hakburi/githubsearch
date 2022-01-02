import ProjectDescription

let projectName: String = "GithubSearch"
let organizationName: String = "GenithLabs"
let bundleName: String = "com.genithlabs"

let projectSettings = Settings(
  debug: Configuration(xcconfig: Path("config/Debug.xcconfig")),
  release: Configuration(xcconfig: Path("config/Release.xcconfig")),
  defaultSettings: .none
)

let targetSettings = Settings(
  debug: Configuration(xcconfig: Path("config/Debug.xcconfig")),
  release: Configuration(xcconfig: Path("config/Release.xcconfig")),
  defaultSettings: .none
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
