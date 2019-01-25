﻿function Get-TwitterAccount_VerifyCredentials {
<#
.SYNOPSIS
    Manage account settings and profile

.DESCRIPTION
    GET account/verify_credentials
    
    Returns an HTTP 200 OK response code and a representation of the requesting user if authentication was successful; returns a 401 status code and an error message if not. Use this method to test if supplied user credentials are valid.
    
    Request a User's Email Address
    
    The "Request email addresses from users" checkbox is available under the app permissions on developer.twitter.com. Privacy Policy URL and Terms of Service URL fields must be completed in the app settings in order for email address access to function. If enabled, users will be informed via the oauth/authorize dialog that your app can access their email address.
    
    Please note - Your app will need to regenerate the user access tokens for previously authenticated users to access their email address.
    
    Please note - You can view and edit your existing Twitter apps via the Twitter app dashboard if you are logged into your Twitter account on developer.twitter.com.

.PARAMETER include_entities
    The entities node will not be included when set to false .

.PARAMETER skip_status
    When set to either true , t or 1 statuses will not be included in the returned user object.

.PARAMETER include_email
    When set to true email will be returned in the user objects as a string. If the user does not have an email address on their account, or if the email address is not verified, null will be returned.

.NOTES
    This helper function was generated by the information provided here:
    https://developer.twitter.com/en/docs/accounts-and-users/manage-account-settings/api-reference/get-account-verify_credentials

#>
    [CmdletBinding()]
    Param(
        [string]$include_entities,
        [string]$skip_status,
        [string]$include_email
    )
    Begin {

        [hashtable]$Parameters = $PSBoundParameters
                   $CmdletBindingParameters | ForEach-Object { $Parameters.Remove($_) }

        [string]$Method      = 'GET'
        [string]$Resource    = '/account/verify_credentials'
        [string]$ResourceUrl = 'https://api.twitter.com/1.1/account/verify_credentials.json'

    }
    Process {

        If (-Not $OAuthSettings) { $OAuthSettings = Get-TwitterOAuthSettings -Resource $Resource }
        Invoke-TwitterAPI -Method $Method -ResourceUrl $ResourceUrl -Resource $Resource -Parameters $Parameters -OAuthSettings $OAuthSettings

    }
    End {

    }
}
