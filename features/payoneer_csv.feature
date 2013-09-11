Feature: My bootstrapped app kinda works
  In order to get going on coding my awesome app
  I want to have aruba and cucumber setup
  So I don't have to do it myself

  Scenario: App just runs
    When I get help for "payoneer_csv"
    Then the exit status should be 0
    And the banner should be present
    And the banner should document that this app takes options
    And the following options should be documented:
      | --version |
    And the banner should document that this app's arguments are:
      | file_path | which is required |

  Scenario: Run with non existing file
    When I run `payoneer_csv non-existing.pdf`
    Then the output should contain "Cannot find file: non-existing.pdf"

  Scenario: Run with existing file
    When I run `payoneer_csv Transactions.pdf`
    Then the output should contain:
      """
      Transaction Date,Description,Amount,Currency
      10/17/2012 5:58:20 AM,ATM Withdrawal - Vaci u. 42.,-75.29,USD
      10/16/2012 6:41:30 AM,ROSSMANN,-14.2,USD
      10/15/2012 8:30:15 PM,Prima,-4.98,USD
      10/15/2012 8:44:18 AM,PKP Intercity,-48.61,USD
      10/18/2012 2:52:18 AM,ATM Withdrawal - OTP,-51.02,USD
      10/19/2012 11:38:12 PM,PSS SKLEP NR 54,-17.36,USD
      10/19/2012 6:41:14 AM,COSTA COFFEE,-7.41,USD
      """

  Scenario: Run with other existing file
    When I run `payoneer_csv Transactions2.pdf`
    Then the output should contain:
      """
      Transaction Date,Description,Amount,Currency
      10/18/2012 2:52:18 AM,ATM Withdrawal - OTP,-51.02,USD
      10/19/2012 6:41:14 AM,COSTA COFFEE,-7.41,USD
      10/26/2012 8:10:10 PM,Delikatesy Alma,-13.19,USD
      10/26/2012 12:25:14 AM,DEEZER,-4.87,USD
      10/19/2012 11:38:12 PM,PSS SKLEP NR 54,-17.36,USD
      10/26/2012 8:15:31 PM,Delikatesy Alma,-7.83,USD
      10/23/2012 8:23:51 PM,Delikatesy Alma,-31.42,USD
      10/21/2012 10:53:31 PM,CAFE ARTE,-3.14,USD
      10/21/2012 10:21:28 PM,PSS SKLEP,-5.47,USD
      10/23/2012 6:28:09 AM,SJO Empik,-23.17,USD
      10/22/2012 2:47:05 AM,Delikatesy Alma,-77.25,USD
      10/15/2012 8:44:18 AM,PKP Intercity,-48.61,USD
      10/11/2012 8:31:56 PM,Delikatesy Alma,-42.89,USD
      10/10/2012 8:10:37 PM,HAPPY,-4.31,USD
      10/10/2012 8:02:27 PM,Withdrawal Notification Lukasz Bandzarewicz 1198,1198.0,USD
      10/15/2012 8:30:15 PM,Prima,-4.98,USD
      10/17/2012 5:58:20 AM,ATM Withdrawal - Vaci u. 42.,-75.29,USD
      10/16/2012 6:41:30 AM,ROSSMANN,-14.2,USD
      """
