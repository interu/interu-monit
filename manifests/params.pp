# Class: monit::params
#
# This class manages parameters for the Monit module
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class monit::params {
    $gmail_account="test@gmail.com"
    $gmail_password="password"

    $mail_from="test_from@example.com"
    $mail_to="test_to@example.com"
}
