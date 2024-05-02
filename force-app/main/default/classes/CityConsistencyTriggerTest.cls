@isTest
public with sharing class CityConsistencyTriggerTest {
    @testSetup
    static void setup() {
        // Create test account records
        List<Account> testAccounts = new List<Account>{
            new Account(Name = 'Test Account 1', BillingCity = 'Buenos Aires'),
            new Account(Name = 'Test Account 2', BillingCity = 'Lima')
        };
        insert testAccounts;

        // Create test contact record
        Contact testContact = new Contact(
            LastName = 'Test Contact',
            AccountId = testAccounts[0].Id,
            MailingCity = 'New York'
        );
        insert testContact;
    }

    @isTest
    static void CityConsistencyTriggerTest() {
        // Get the test accounts created on setup
        List<Account> testAccountRecords = [
            SELECT BillingCity FROM Account
        ];

        // Change the billing city but just for one and update the list
        testAccountRecords[0].BillingCity = 'Paris';
        update testAccountRecords;
    }
}