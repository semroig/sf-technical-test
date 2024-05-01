trigger CityConsistencyTrigger on Account (after insert, after update) {
    // This variable holds the data in map format of the accounts been inserted/updated
    System.debug(Trigger.newMap);
}