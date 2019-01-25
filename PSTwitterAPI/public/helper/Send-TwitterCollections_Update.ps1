﻿function Send-TwitterCollections_Update {
<#
.SYNOPSIS
    Curate a collection of Tweets

.DESCRIPTION
    POST collections/update
    
    Update information concerning a Collection owned by the currently authenticated user.
    
    Partial updates are not currently supported: please provide name, description, and url whenever using this method. Omitted description or url parameters will be treated as if an empty string was passed, overwriting any previously stored value for the Collection.

.PARAMETER id
    The identifier of the Collection to modify.

.PARAMETER description
    A brief description of this Collection in 160 characters or fewer.

.PARAMETER url
    A fully-qualified URL to associate with this Collection.

.NOTES
    This helper function was generated by the information provided here:
    https://developer.twitter.com/en/docs/tweets/curate-a-collection/api-reference/post-collections-update

#>
    [CmdletBinding()]
    Param(
        [string]$id,
        [string]$description,
        [string]$url
    )
    Begin {

        [hashtable]$Parameters = $PSBoundParameters
                   $CmdletBindingParameters | ForEach-Object { $Parameters.Remove($_) }

        [string]$Method      = 'POST'
        [string]$Resource    = '/collections/update'
        [string]$ResourceUrl = 'https://api.twitter.com/1.1/collections/update.json'

    }
    Process {

        If (-Not $OAuthSettings) { $OAuthSettings = Get-TwitterOAuthSettings -Resource $Resource }
        Invoke-TwitterAPI -Method $Method -ResourceUrl $ResourceUrl -Resource $Resource -Parameters $Parameters -OAuthSettings $OAuthSettings

    }
    End {

    }
}
