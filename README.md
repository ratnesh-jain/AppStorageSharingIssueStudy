# How to reproduce.
1. Select the AppFeature build scheme.
2. Enable Preview for AppView.
3. Tap on "Toggle is On" button.
4. Tap on "Toggle is On AppGroup" button.

# Issue demonstration.


https://github.com/user-attachments/assets/5a3c26a4-1340-4319-b177-8f96f1ce83ae

# Solution:
- The problem was that, it was creating a new instance of the UserDefault for the same suite name every time we refer to it.
 
```swift
extension UserDefaults {
    public static var appGroup: UserDefaults {
        guard let defaultGroup = UserDefaults(suiteName: "group.com.ratnesh.AppStorageSharingIssueStudy") else {
            fatalError()
        }
        return defaultGroup
    }
}
```

- This changes the ObjectIdentity of the `UserDefault.appGroup` object, causing inconsistent observation.
- So changing this to a single instance object, fixes the issue.

```swift
extension UserDefaults {
    nonisolated(unsafe) static let appGroup = UserDefaults(suiteName: "group.com.ratnesh.AppStorageSharingIssueStudy")!
}

extension SharedKey where Self == AppStorageKey<Bool>.Default {
    public static var isOnAppGroup: Self {
        return Self[.appStorage("isOnAppGroup", store: UserDefaults.appGroup), default: false]
    }
    
    public static var isOn: Self {
        Self[.appStorage("isOn"), default: false]
    }
}

```
  
