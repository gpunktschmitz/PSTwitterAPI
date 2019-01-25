﻿function Get-TwitterFriendships_Outgoing {
<#
.SYNOPSIS
    Follow, search, and get users

.DESCRIPTION
    GET friendships/outgoing
    
    Returns a collection of numeric IDs for every protected user for whom the authenticating user has a pending follow request.

.PARAMETER cursor
    Causes the list of connections to be broken into pages of no more than 5000 IDs at a time. The number of IDs returned is not guaranteed to be 5000 as suspended users are filtered out after connections are queried. If no cursor is provided, a value of -1 will be assumed, which is the first "page."
The response from the API will include a previous_cursor and next_cursor to allow paging back and forth. See Using cursors to navigate collections for more information.

.PARAMETER stringify_ids
    Some programming environments will not consume Twitter IDs due to their size. Provide this option to have IDs returned as strings instead. More about Twitter IDs.

.NOTES
    This helper function was generated by the information provided here:
    https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/get-friendships-outgoing

#>
    [CmdletBinding()]
    Param(
        [string]$cursor,
        [string]$stringify_ids
    )
    Begin {

        [hashtable]$Parameters = $PSBoundParameters
                   $CmdletBindingParameters | ForEach-Object { $Parameters.Remove($_) }

        [string]$Method      = 'GET'
        [string]$Resource    = '/friendships/outgoing'
        [string]$ResourceUrl = 'https://api.twitter.com/1.1/friendships/outgoing.format'

    }
    Process {

        If (-Not $OAuthSettings) { $OAuthSettings = Get-TwitterOAuthSettings -Resource $Resource }
        Invoke-TwitterAPI -Method $Method -ResourceUrl $ResourceUrl -Resource $Resource -Parameters $Parameters -OAuthSettings $OAuthSettings

    }
    End {

    }
}
