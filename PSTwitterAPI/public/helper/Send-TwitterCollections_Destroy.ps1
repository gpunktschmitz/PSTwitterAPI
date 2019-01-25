﻿function Send-TwitterCollections_Destroy {
<#
.SYNOPSIS
    Curate a collection of Tweets

.DESCRIPTION
    POST collections/destroy
    
    Permanently delete a Collection owned by the currently authenticated user.

.PARAMETER id
    The identifier of the Collection to destroy.

.NOTES
    This helper function was generated by the information provided here:
    https://developer.twitter.com/en/docs/tweets/curate-a-collection/api-reference/post-collections-destroy

#>
    [CmdletBinding()]
    Param(
        [string]$id
    )
    Begin {

        [hashtable]$Parameters = $PSBoundParameters
                   $CmdletBindingParameters | ForEach-Object { $Parameters.Remove($_) }

        [string]$Method      = 'POST'
        [string]$Resource    = '/collections/destroy'
        [string]$ResourceUrl = 'https://api.twitter.com/1.1/collections/destroy.json'

    }
    Process {

        If (-Not $OAuthSettings) { $OAuthSettings = Get-TwitterOAuthSettings -Resource $Resource }
        Invoke-TwitterAPI -Method $Method -ResourceUrl $ResourceUrl -Resource $Resource -Parameters $Parameters -OAuthSettings $OAuthSettings

    }
    End {

    }
}
