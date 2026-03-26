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

**Always Validate**: Check all input data at system boundaries.

**Whitelist Over Blacklist**: Only allow known-good values.

---

## Authentication

### Passwords
- Use strong hashing (bcrypt, argon2, PBKDF2)
- Minimum 12 characters
- Rate limit login attempts
- Never store plain text

### Token Best Practices
- Short expiration (15-60 minutes)
- Use refresh tokens for long sessions
- Store securely (httpOnly, not accessible to JavaScript)
- Validate issuer, audience

---

## Authorization

- Check permissions at protected routes
- Always verify user owns the resource

---

## Injection Prevention

Use parameterized queries. Never concatenate user input into SQL.

---

## Output Encoding

Always encode output based on context:
- HTML context: htmlEscape()
- URL context: urlEncode()
- JavaScript context: jsStringEscape()

---

## Secrets Management

- Use environment variables (never commit .env)
- Never log secrets
- Never send secrets to client

---

## Rate Limiting

Prevent abuse with rate limiting:
- General API: 100 requests/15min
- Auth endpoints: 5 requests/15min

---

## Security Headers

Configure:
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
