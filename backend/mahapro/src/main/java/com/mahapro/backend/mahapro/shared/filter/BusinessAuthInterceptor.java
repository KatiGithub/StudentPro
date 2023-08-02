package com.mahapro.backend.mahapro.shared.filter;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseToken;
import com.mahapro.backend.mahapro.dao.Business.BusinessUserDao;
import com.mahapro.backend.mahapro.shared.provider.JwtTokenProvider;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class BusinessAuthInterceptor implements HandlerInterceptor {

    @Autowired
    FirebaseAuth firebaseAuth;

    @Autowired
    BusinessUserDao businessUserDao;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        try {
            String jwtToken = JwtTokenProvider.getToken(request.getHeader(HttpHeaders.AUTHORIZATION));
            FirebaseToken firebaseToken = firebaseAuth.verifyIdToken(jwtToken);

            businessUserDao.getBusinessUserByFirebaseUserId(firebaseToken.getUid());

            return true;
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            return false;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
    }
}
