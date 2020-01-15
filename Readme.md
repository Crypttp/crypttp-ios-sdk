# Crypttp-ios

## Environment
```
iOS 10+
```

## Instalation
### 1. In the Podfile of project add the following line
```
pod ‘CrypttpFramework’
```

After line added

```
pod install
```

### 2. Register universal link

Anywhere (between keys) in <strong>Info.plist</strong> add the following code.

Probably <strong>CFBundleURLTypes</strong> key is already exists, then you should add required shcema to array

```XML
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>crypttp</string>
        </array>
        <key>CFBundleURLName</key>
        <string></string>
    </dict>
</array>
```

## Usage

SDK methods are called through the Crypttp class.

```Swift
guard let params = Crypttp.shared.parseCrypttpDeeplink(url: incomingURL) {
    return false
}
```

## IMPORTANT

Use this method to send transaction hash to Crypttp 

`If crypttp does not receive hashes from you, then we have the right to disconnect you from the system without explanation`

```Swift
Crypttp.shared.sendTransactionHash(transactionId:"id", transactionHash:"hash", success: {
    print("success")
}) { error in
    print("Error: \(error.localizedDescription)")
}
```

## Get more avareness for your wallet app

Signup at [Dashboard](https://crypttp.com/dashboard)

Navigate to Settings/Wallet App

Set:

* Name

* Discription

* Icon

* Available currencies

* Urls to AppStore and Google Play

This configuration will help you promote your wallet app. 

Every user that has no wallet installed while paying at Crypttp merchants will be redirected to a special page where user can find featured wallets