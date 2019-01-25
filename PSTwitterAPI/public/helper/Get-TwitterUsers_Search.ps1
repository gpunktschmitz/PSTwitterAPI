﻿function Get-TwitterUsers_Search {
<#
.SYNOPSIS
    Follow, search, and get users

.DESCRIPTION
    GET users/search
    
    Provides a simple, relevance-based search interface to public user accounts on Twitter. Try querying by topical interest, full name, company name, location, or other criteria. Exact match searches are not supported.
    
    Only the first 1,000 matching results are available.

.PARAMETER q
    The search query to run against people search.

.PARAMETER page
    Specifies the page of results to retrieve.

.PARAMETER count
    The number of potential user results to retrieve per page. This value has a maximum of 20.

.PARAMETER include_entities
    The entities node will not be included in embedded Tweet objects when set to false .

.NOTES
    This helper function was generated by the information provided here:
    https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/get-users-search

#>
    [CmdletBinding()]
    Param(
        [string]$q,
        [string]$page,
        [string]$count,
        [string]$include_entities
    )
    Begin {

        [hashtable]$Parameters = $PSBoundParameters
                   $CmdletBindingParameters | ForEach-Object { $Parameters.Remove($_) }

        [string]$Method      = 'GET'
        [string]$Resource    = '/users/search'
        [string]$ResourceUrl = 'https://api.twitter.com/1.1/users/search.json'

    }
    Process {

        If (-Not $OAuthSettings) { $OAuthSettings = Get-TwitterOAuthSettings -Resource $Resource }
        Invoke-TwitterAPI -Method $Method -ResourceUrl $ResourceUrl -Resource $Resource -Parameters $Parameters -OAuthSettings $OAuthSettings

    }
    End {

    }
}
