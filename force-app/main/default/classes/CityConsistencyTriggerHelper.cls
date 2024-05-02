public with sharing class CityConsistencyTriggerHelper {
    public static void CityConsistencyTriggerHelper(Map<Id, String> filteredAccountDataMap) {
        // I need to retrieve all the Contact records related
        List<Contact> contactRecords = [
            SELECT AccountId, MailingCity
            FROM Contact
            WHERE AccountId IN :filteredAccountDataMap.keySet()
        ];

        // Iterate trough the list of contacts updating the Mailing City with the new Billing City from the related account
        for (Contact contactRecord : contactRecords) {
            contactRecord.MailingCity = filteredAccountDataMap.get(contactRecord.AccountId);
        }

        // DML Operation to update the list of contacts with the new cities
        update contactRecords;
    }
}