# Apex Streams ☁️ 

This is an Apex library to support functional-style operations on collections, such as filtering, aggregating, transforming, etc.

This supports both SObjects and user-defined types.

## Dependencies

- [Salesforce CLI](https://developer.salesforce.com/tools/sfdxcli)

## Deploying

<a href="https://githubsfdeploy.herokuapp.com?owner=MuriloKakazu&repo=apex-streams">
  <img alt="Deploy to Salesforce" src="images/sf-deploy.png">
</a>

## How to use

### Filtering

Filtering by field supports the following operations:

| Operation             | Details                                   |
|-----------------------|-------------------------------------------|
| equals()              | If not primitives, will compare the objects's reference in memory |
| notEquals()           | If not primitives, will compare the objects's reference in memory |
| greaterThan()         |                                           |
| lessThan()            |                                           |
| greaterThanOrEquals() |                                           |
| lessThanOrEquals()    |                                           |
| isIn()                | Works comparing with `Set<Object>` only   |
| isNotIn()             | Works comparing with `Set<Object>` only   |
| isNull()              |                                           |
| hasValue()            |                                           |

Example:

```apex
List<Person> filteredPeople = (List<Person>)
    DynamicStream.of(people)
        .filter().field('age').greaterThan(21)
        .filter().field('gender').equals('Male')
        .collect().asListOf(Person.class)
```

You may also filter using predicates that implement the `DynamicPredicate` interface:

```apex
List<Account> filteredAccount = (List<Account>)
    DynamicStream.of(accounts)
        .filter().keeping(new HasFullBillingAddress())
        .filter().keeping(new HasOrdersAwaitingPayment())
        .collect().asListOf(Account.class)
```

### Grouping/Aggregating

```apex
Map<Integer, List<Dynamic>> peopleGroupedByAge =
    DynamicStream.of(people)
        .group().byIntegers('age')
```