const String qGetAllTransactions = """
query getAllTransactions {
  transaction {
    category
    created_at
    date
    description
    id
    status
    user_id
    value
  }
}

""";
