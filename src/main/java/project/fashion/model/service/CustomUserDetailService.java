package project.fashion.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import project.fashion.model.entity.Account;
import project.fashion.model.entity.CustomUserDetail;
import project.fashion.model.repository.AccountRepo;

import java.util.Collection;
import java.util.HashSet;

@Service
public class CustomUserDetailService implements UserDetailsService {
    @Autowired
    private AccountRepo accountRepo;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Account account = accountRepo.findByUserName(username);
        if(account == null){
            throw new UsernameNotFoundException("Sai");
        }

        Collection<GrantedAuthority> grantedAuthoritySet = new HashSet<>();
        String role = account.getRole().name();

        grantedAuthoritySet.add(new SimpleGrantedAuthority(role));

        return new CustomUserDetail(account,grantedAuthoritySet);
    }
}
