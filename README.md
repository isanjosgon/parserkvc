# parserkvc

JSON parser based on KVC.

### How to use ###

Want to parse json-server
```sh
{
  "key1" : "value1",
  "key2" : "value2",
  "key3" : "value3",
  ...
}
```
to your model in an easy way. Just call the category with the proper NSDictionary
```sh
- (void)parseValuesWithDictionary:(NSDictionary *)json;
```

** If you want to change the name of some key of the json by your property name,
just add it
```sh
- (NSDictionary*)mappingKeyIfNeeded;
```
like a key:value pair
```sh
{ @"json_key" : @"mymodel_key" }
```
