# flutter_advanced_graphql

It is a demo of Clean Architecture with GraphQL using an advanced tool in Flutter.

## Goal
- generate dart types and classes which covers GraphQL API queries
- local schema update
- autocomplete and validation of GraphQL queries
- ability to work with API without waiting of backend implementation
- perfectly curated separation
- user-friendly package structure
- easy to keep the project running

## Tooling
- [artemis](https://pub.dev/packages/artemis)
- [graphql-faker](https://github.com/APIs-guru/graphql-faker)

## IDE & plugins
- [Android Studio](https://developer.android.com/studio) or [VSCode](https://code.visualstudio.com/)
- [GraphQL](https://jimkyndemeyer.github.io/js-graphql-intellij-plugin/docs/getting-started) for Android Studio
- [Prisma](https://jimkyndemeyer.github.io/js-graphql-intellij-plugin/docs/getting-started) for VSCode

## Getting Started

1. Start install `graphql-faker`

        npm install -g graphql-faker

   or

        yarn global add graphql-faker

2. Start local `graphql` server `graphql-faker fake.schema --open`
3. Dart types update

        pub run build_runner build

   or

        flutter pub run build_runner build

4. Start app

        flutter run