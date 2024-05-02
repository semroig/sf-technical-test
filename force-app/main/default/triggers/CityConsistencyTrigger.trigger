trigger CityConsistencyTrigger on Account (after update) {
    // Initialize a map where I will store the id of the filtered account records and the new billing city data
    Map<Id, String> filteredAccountDataMap = new Map<Id, String>();

    // Filter which records changed their billing city
    for (Id accountId : Trigger.newMap.keySet()) {
        // Compare the Billing City field old value with the new value
        if (Trigger.oldMap.get(accountId).get('BillingCity') != Trigger.newMap.get(accountId).get('BillingCity')) {
            // Add key/value set to map, using account id and new billing city
            filteredAccountDataMap.put(accountId,  (String) Trigger.newMap.get(accountId).get('BillingCity'));
        }
    }

    // Call the helper to execute the SOQL and DML operations on the Contact object
    CityConsistencyTriggerHelper.CityConsistencyTriggerHelper(filteredAccountDataMap);
}