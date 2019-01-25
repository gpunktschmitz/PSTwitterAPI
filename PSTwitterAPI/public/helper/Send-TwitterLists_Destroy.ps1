function Send-TwitterLists_Destroy {

<#
.SYNOPSIS
    Create and manage lists

.DESCRIPTION
    POST lists/destroy
    
    Deletes the specified list. The authenticated user must own the list to be able to destroy it.

.PARAMETER owner_screen_name
    The screen name of the user who owns the list being requested by a slug .

.PARAMETER owner_id
    The user ID of the user who owns the list being requested by a slug .

.PARAMETER list_id
    The numerical id of the list.

.PARAMETER slug
    You can identify a list by its slug instead of its numerical id. If you decide to do so, note that you'll also have to specify the list owner using the owner_id or owner_screen_name parameters.

.NOTES
    This helper function was generated by the information provided here:
    https://developer.twitter.com/en/docs/accounts-and-users/create-manage-lists/api-reference/post-lists-destroy

#>
    [CmdletBinding()]
    Param(
        [string]$owner_screen_name,
        [string]$owner_id,
        [string]$list_id,
        [string]$slug
    )
    Begin {

        [string]$Method      = 'POST'
        [string]$Resource    = '/lists/destroy'
        [string]$ResourceUrl = 'https://api.twitter.com/1.1/lists/destroy.json'

        [hashtable]$Parameters = $PSBoundParameters
                   $CmdletBindingParameters | % { $Parameters.Remove($_) }

    }
    Process {

        If (-Not $OAuthSettings) { $OAuthSettings = Get-TwitterOAuthSettings -Resource $Resource }
        Invoke-TwitterAPI -Resource $Resource -Method $Method -Parameters $Parameters -OAuthSettings $OAuthSettings

    }
    End {

    }
}
