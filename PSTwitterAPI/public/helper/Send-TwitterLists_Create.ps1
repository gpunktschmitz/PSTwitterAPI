﻿function Send-TwitterLists_Create {
<#
.SYNOPSIS
    Create and manage lists

.DESCRIPTION
    POST lists/create
    
    Creates a new list for the authenticated user. Note that you can create up to 1000 lists per account.

.PARAMETER mode
    Whether your list is public or private. Values can be public or private . If no mode is specified the list will be public.

.PARAMETER description
    The description to give the list.

.NOTES
    This helper function was generated by the information provided here:
    https://developer.twitter.com/en/docs/accounts-and-users/create-manage-lists/api-reference/post-lists-create

#>
    [CmdletBinding()]
    Param(
        [string]$mode,
        [string]$description
    )
    Begin {

        [hashtable]$Parameters = $PSBoundParameters
                   $CmdletBindingParameters | ForEach-Object { $Parameters.Remove($_) }

        [string]$Method      = 'POST'
        [string]$Resource    = '/lists/create'
        [string]$ResourceUrl = 'https://api.twitter.com/1.1/lists/create.json'

    }
    Process {

        If (-Not $OAuthSettings) { $OAuthSettings = Get-TwitterOAuthSettings -Resource $Resource }
        Invoke-TwitterAPI -Method $Method -ResourceUrl $ResourceUrl -Resource $Resource -Parameters $Parameters -OAuthSettings $OAuthSettings

    }
    End {

    }
}
