require 'mongo-nvim'.setup {
  -- connection string to your mongodb
  connection_string = "mongodb://127.0.0.1:27017",
  -- key to use for previewing/picking documents
  -- either a string or custom table of string or functions
  list_document_key = "_id",
  -- delete selected document in document_picker
  delete_document_mapping = nil -- "<c-d>"
}
