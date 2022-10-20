msg_reply.alias = {
    keyword = {
        regex = { "Alias>" }
    },
    limit = {
        cd = 2
    },
    echo = { lua = "alias" }
}