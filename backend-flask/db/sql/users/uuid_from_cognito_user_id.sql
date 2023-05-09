SELECT 
    users.uuid
FROM public.users
WHERE
    users.cognito_user-Id = %(cognito_user_id)s
LIMIT 1
