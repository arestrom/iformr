
iformr
======

Overview
--------

This package is intended to provide a collection of user-friendly tools to leverage the power of the iFormBuilder API. The package is in an early-development state. Additional functions will be added as time allows.

iFormBuilder <https://www.iformbuilder.com/> provides a commercial platform for mobile data collection. The platform includes a number of user-friendly tools to build and distribute mobile forms, assign users, edit data, and retrieve data from the cloud. Unfortunately, the point-and-click web interface can become a major bottleneck as data volume increases, or you try to push the limits of form design.

Certain tasks, such a preloading large option-lists with newly collected data, are often impractical unless they can be automated. Fortunately, the platform also includes an excellent *Application Programming Interface* (API) <http://docs.iformbuilder.apiary.io/#>.

Just about anything that can be done using the iFormBuilder web interface can be done infinitely faster using the API. However, for a majority of users, requesting access tokens, or learning the correct syntax to navigate the API can be an insurmountable hurdle. The functions in this repository aim to lower the threshold so that biologists, or field staff with only minimal programming experience will feel comfortable with the API. The aim is to make form building, data collection, and data retrieval much more efficient.

This package was inspired by the Hadley Wickham's httr package. In particular the *oauth-server-side.R* file at: <https://github.com/r-lib/httr/blob/master/R/oauth-server-side.R>. The *hex\_to\_raw()* function from Jeroen Ooms openssl package has also been incorporated.

Installation
------------

There was a bug in R-3.4.0 that prevented installation of this package. You will need to install R-3.4.1 or higher.

``` r
# Install the development version from GitHub:
# install.packages("devtools")
devtools::install_github("arestrom/iformr")
```

Storing API connection credentials
----------------------------------

In order to use the functions in this package you **must** first get a `client_key` and `client_secret` for your profile from iFormBuilder. If you have a dedicated server this can be done by logging in to your iFormBuilder server as a *server admin* and clicking on the *Server Admin* tab. Select *Manage Profiles*, highlight the row for the desired profile then click *Manage*. Next select *Server Admin* &gt; *API Apps* &gt; *New Client* and follow the directions to create a new client. You will be asked to assign the API application to an existing *Username*. It is good practice to create a separate, dedicated *user* for any API requests. After creating the new client, a new *Client Key* and *Client Secret* will be posted to the *API Applications* table.

If you do not have dedicated server you will need to contact iFormBuilder for directions on how to obtain a client\_key and client\_secret.

To add the client\_key and client\_secret to your .Renviron file you will first need to create, or locate, your .Renviron file. In your R console, enter:

``` r
normalizePath("~/")
```

The path to your .Renviron file will be displayed. Detailed instructions on how to add the client\_key and client\_secret to your .Renviron file can be found in the Appendix section of: <https://cran.r-project.org/web/packages/httr/vignettes/api-packages.html>

Briefly, the procedure is as follows. Use RStudio to either create a new .Renviron file if it does not exist (see instructions at link above), or open the existing .Renviron file from the specified location. It will look similar to:

    MyProfileNameClientKey=eb7411c1525c486ae7a64727965c3e042eab7389
    MyProfileNameClientSecret=471dbbe5061f4c1db9141c48cc1d0d5a96e60cc6

Simply add your new client\_key and client\_secret as in the example above. The *client\_key\_name* is the section before the equals sign. The *client\_key* is the value following the equals sign. The same pattern is used for the *client secret*. You can enter any convenient name for the name portion. These names are what you will enter as parameters to the `get_iform_access_token()` function to request an `access_token`.

Make sure there is an extra space at the bottom of the last entry in the .Renviron file before saving, or R will silently fail to read the entries. You will need to close RStudio and then reopen after saving. Afterwards, every time you open RStudio the environment variables will be available in your session.

Obtaining an `access_token` is a prerequisite for any requests made to the iFormBuilder API.
