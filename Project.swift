import ProjectDescription

let projectName: String = "GithubSearch"
let organizationName: String = "GenithLabs"
let bundleName: String = "com.genithlabs"

// TODO: share xcconfig 파일을 프로젝트 관리할 방법 강구!!
let projectSettings = Settings(
  debug: Configuration(xcconfig: Path("Configs/Project-Debug.xcconfig")),
  release: Configuration(xcconfig: Path("Configs/Project-Release.xcconfig")),
  defaultSettings: .none
)

let targetSettings = Settings(
  debug: Configuration(xcconfig: Path("Configs/GithubSearch-Debug.xcconfig")),
  release: Configuration(xcconfig: Path("Configs/GithubSearch-Release.xcconfig")),
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
  ],
  additionalFiles: ["Configs/**"]
)
