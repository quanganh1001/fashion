package project.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import project.fashion.entity.Account;
import project.fashion.entity.CustomUserDetail;

import java.util.Collection;
import java.util.HashSet;

@Service
public class CustomUserDetailService implements UserDetailsService {
    @Autowired
    private AccountService accountService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Account account = accountService.findByUserName(username);
        if(account == null){
            throw new UsernameNotFoundException("Sai");
        }
        Collection<GrantedAuthority> grantedAuthoritySet = new HashSet<>();
        String role = account.getRole().getRoleName();

        grantedAuthoritySet.add(new SimpleGrantedAuthority(role));

        System.out.println("~~~~~~~~~~~~~~~" + grantedAuthoritySet);

        return new CustomUserDetail(account,grantedAuthoritySet);
    }
}
