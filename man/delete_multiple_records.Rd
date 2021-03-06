% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/page_records.R
\name{delete_multiple_records}
\alias{delete_multiple_records}
\title{Delete multiple records}
\usage{
delete_multiple_records(
  server_name,
  profile_id,
  page_id,
  record_ids,
  access_token
)
}
\arguments{
\item{server_name}{String of the iFormBuilder server name}

\item{profile_id}{Integer of the iFormBuilder profile ID}

\item{page_id}{Integer ID of the page from which to delete the record.}

\item{record_ids}{Integer vector of the record IDs to delete.}

\item{access_token}{Access token produced by \code{\link{get_iform_access_token}}}
}
\value{
Integer vector of the deleted record IDs
}
\description{
Delete a list of records
}
\examples{
\dontrun{
# Set id to ascending order and pull only records greater than the last_id
since_id <- 5L
field_string <- glue::glue('id:<(>"{since_id}"), {field_list}')

# Get access_token
access_token <- get_iform_access_token(
  server_name = "your_server_name",
  client_key_name = "your_client_key_name",
  client_secret_name = "your_client_secret_name")

# Get the id of a single form in the profile given the form name
form_id <- get_page_id(
  server_name = "your_server_name",
  profile_id = 123456,
  page_name = "your_form_p",
  access_token = access_token)

# Get all existing records for a set of columns from a form or subform
parent_form_records <- get_all_records(
  server_name = "your_server_name",
  profile_id = 123456,
  page_id = form_id,
  fields = "fields",
  limit = 1000,
  offset = 0,
  access_token = access_token,
  field_string,
  since_id)

# Get IDs of the last two records added so they can be deleted.
records_to_delete = tail(parent_form_records$id, 2)

# Delete the last two records added to the form
 deleted_records = delete_multiple_records(
   server_name = "your_server_name",
   profile_id = "your_profile_id",
   page_id = form_id,
   record_ids = records_to_delete,
   access_token = access_token)
}
}
\author{
Bill Devoe, \email{William.DeVoe@maine.gov}
}
