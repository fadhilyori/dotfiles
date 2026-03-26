<!-- Context: standards/security | Priority: high | Version: 3.1 | Updated: 2026-03-26 -->

# Security Standards

**Golden Rule**: Never trust user input. Validate everything.

---

## Quick Checklist

- [ ] Input validation on all entry points
- [ ] Output encoding/escaping
- [ ] Authentication on protected resources
- [ ] Authorization checks
- [ ] No secrets in code
- [ ] Secure communication
- [ ] Security headers configured
- [ ] Rate limiting applied

---

## Input Validation

### Always Validate
Check all input data at system boundaries.

```
// Validate at boundary
function createUser(request) -> Result:
    validation = validateSchema(request.body, {
        email: required, validEmail,
        age: required, integer, min(0), max(150),
        name: required, string, min(1), max(100)
    })
    
    if not validation.isValid:
        return Failure(validation.errors)
    
    // Safe to use validated data
    return createUser(validation.data)
```

### Whitelist Over Blacklist
Only allow known-good values.

```
// Good: Whitelist allowed fields
allowedFields = ["name", "email", "bio"]
updateData = pick(request.body, allowedFields)

// Bad: Blacklist dangerous fields
// Attacker can use different field names
```

---

## Authentication

### Passwords
- Use strong hashing (bcrypt, argon2, PBKDF2)
- Minimum 12 characters
- Rate limit login attempts
- Never store plain text

```
// Hash password
hash = passwordHash(password, cost: 12)

// Verify password
isValid = passwordVerify(password, hash)
```

### Token Best Practices
```
// Sign with strong secret
token = generateToken(
    payload: { userId: user.id },
    secret: environment.JWT_SECRET,
    expires: "1 hour",
    issuer: "myapp"
)

// Verify on every request
decoded = verifyToken(token, environment.JWT_SECRET)
```

**Token Rules**:
- Short expiration (15-60 minutes)
- Use refresh tokens for long sessions
- Store securely (httpOnly, not accessible to JavaScript)
- Validate issuer, audience

---

## Authorization

### Check Permissions
```
function requireRole(role):
    return function(request):
        if not request.user:
            return Failure("Unauthorized")
        if not request.user.hasRole(role):
            return Failure("Forbidden")
        return Success(request)

// Usage
route("/admin/users", requireRole("admin"), deleteUser)
```

### Resource Ownership
Always verify user owns the resource.

```
function updateDocument(docId, userId, updates) -> Result:
    doc = findDocument(docId)
    
    if not doc:
        return Failure("Not found")
    if doc.ownerId != userId:
        return Failure("Not authorized")
    
    return Success(doc.update(updates))
```

---

## Injection Prevention

### Use Parameterized Queries
```
// Good: Parameterized query
users = database.query(
    "SELECT * FROM users WHERE email = ?",
    [email]
)

// Bad: String concatenation - NEVER DO THIS
users = database.query(
    "SELECT * FROM users WHERE email = '" + email + "'"
)
```

### ORM Protection
Most ORMs automatically parameterize queries:
```
user = User.findOne({ where: { email: email } })
```

---

## Output Encoding

Always encode output based on context:

```
// HTML context
encoded = htmlEscape(userInput)

// URL context
url = "https://example.com/?name=" + urlEncode(name)

// JavaScript context
script = "var name = " + jsStringEscape(name) + ";"
```

---

## Secrets Management

### Environment Variables
```
# .env file (never commit this!)
DATABASE_URL=protocol://user:pass@host/db
JWT_SECRET=your-secret-key
API_KEY=external-api-key

# Load in application
dbUrl = environment.DATABASE_URL
```

### What NOT to Do
```
// NEVER commit secrets
const API_KEY = "sk-1234567890abcdef"

// NEVER log secrets
log("Config: " + config) // May include secrets!

// NEVER send secrets to client
return { apiKey: environment.API_KEY } // WRONG!
```

---

## Rate Limiting

Prevent abuse with rate limiting:

```
// General API limit
apiLimiter = rateLimit(
    window: 15 minutes,
    max: 100 requests per window
)

// Stricter for auth endpoints
authLimiter = rateLimit(
    window: 15 minutes,
    max: 5 requests per window
)

apply("/api/*", apiLimiter)
apply("/auth/*", authLimiter)
```

---

## Security Headers

Configure security headers:

- **Strict-Transport-Security**: Force HTTPS
- **X-Content-Type-Options**: Prevent MIME sniffing
- **X-Frame-Options**: Prevent clickjacking
- **Content-Security-Policy**: Control resource loading

---

## Dependency Security

- Regular security audits
- Keep dependencies updated
- Pin versions for reproducibility
- Review new dependencies
- Monitor vulnerability databases

---

## Security Review Checklist

Before deploying:

- [ ] All inputs validated
- [ ] All outputs encoded
- [ ] Authentication enforced
- [ ] Authorization checked
- [ ] No secrets in code
- [ ] Rate limiting applied
- [ ] Security headers set
- [ ] Dependencies audited
- [ ] Error messages don't leak info
- [ ] Logs don't contain secrets
