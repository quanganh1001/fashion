package project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import project.model.Account;
import project.DTO.CustomUserDetailDTO;

import java.util.Collection;
import java.util.HashSet;

@Service
public class CustomUserDetailService implements UserDetailsService {
    @Autowired
    private AccountService accountService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Account account = accountService.findByUserName(username);

        Collection<GrantedAuthority> grantedAuthoritySet = new HashSet<>();
        String role = account.getRole().name();

        grantedAuthoritySet.add(new SimpleGrantedAuthority(role));

        return new CustomUserDetailDTO(account,grantedAuthoritySet);
    }
}
