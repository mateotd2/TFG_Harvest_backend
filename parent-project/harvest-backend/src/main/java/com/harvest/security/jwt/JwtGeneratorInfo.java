package com.harvest.security.jwt;

import com.harvest.security.UserDetailsImpl;
import io.jsonwebtoken.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@Component
public class JwtGeneratorInfo {

    private static final Logger logger = LoggerFactory.getLogger(JwtGeneratorInfo.class);

    @Value("${app.jwtSecret}")
    private String jwtSecret;
    @Value("${app.jwtExpirationMs}")
    private int jwtExpirationMs;


    public String generateJwtToken(UserDetailsImpl userPrincipal) {
        return generateTokenFromUsername(userPrincipal.getId() ,userPrincipal.getUsername());
    }

    public String generateTokenFromUsername(Long id,String username) {

        Claims claims = Jwts.claims();

        claims.setSubject(username).setIssuedAt(new Date()).setExpiration(new Date(System.currentTimeMillis()+ jwtExpirationMs * 60 * 24 * 1000));

        claims.put("userId", id);
//        claims.put("role", )


       return Jwts.builder().setClaims(claims).signWith(SignatureAlgorithm.HS512,jwtSecret.getBytes()).compact();
//        return Jwts.builder().setSubject(username).setIssuedAt(new Date())
//                .setExpiration(new Date((new Date()).getTime() + jwtExpirationMs)).signWith(SignatureAlgorithm.HS512, jwtSecret)
//                .compact();
    }

    public String getUserNameFromJwtToken(String token) {
        return Jwts.parser().setSigningKey(jwtSecret.getBytes()).parseClaimsJws(token).getBody().getSubject();
    }

    public JwtInfo getInfo(String token) {
        Claims claims = Jwts.parserBuilder().setSigningKey(jwtSecret.getBytes()).build().parseClaimsJws(token).getBody();
        return new JwtInfo(((Integer) claims.get("userId")).longValue(), claims.getSubject(), (List<String>) claims.get("roles"));
    }

    public boolean validateJwtToken(String authToken) {
        try {
            Jwts.parser().setSigningKey(jwtSecret.getBytes()).parseClaimsJws(authToken);
            return true;
        } catch (SignatureException e) {
            logger.error("Invalid JWT signature: {}", e.getMessage());
        } catch (MalformedJwtException e) {
            logger.error("Invalid JWT token: {}", e.getMessage());
        } catch (ExpiredJwtException e) {
            logger.error("JWT token is expired: {}", e.getMessage());
        } catch (UnsupportedJwtException e) {
            logger.error("JWT token is unsupported: {}", e.getMessage());
        } catch (IllegalArgumentException e) {
            logger.error("JWT claims string is empty: {}", e.getMessage());
        }

        return false;
    }


}
