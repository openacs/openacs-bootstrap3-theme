<if @login_p;literal@ true>
    <li class="dropdown" style="z-index:1100;">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="padding-top:8px;padding-bottom:0;">@photo;noquote@ </a>
        <ul class="dropdown-menu">
            <li>
                <!-- user greeting or login message -->
                <a href="/pvt/home">#acs-subsite.Welcome_user#  </a>
            </li>

            <li>
                <a href="@whos_online_url@" title="#acs-subsite.Whos_Online_link_label#">
                    @num_users_online;noquote@
                    <if @num_users_online@ eq 1>
                        #acs-subsite.Member#
                    </if>
                    <else>
                        #acs-subsite.Members#
                    </else>
                    #acs-subsite.Online#
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="/register/logout" title="#acs-subsite.Logout_from_system#">#acs-subsite.Logout#</a>
            </li>
        </ul>
    </li>
</if>
<else>
    <li><a href="@login_url@">Log In</a></li>
</else>  
