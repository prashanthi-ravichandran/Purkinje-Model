function [ RyR ] = switch_RyR_int1(dt,Cai,RyR, rand1, rand2)

n = 4;
m = 3; 
ka_minus = 0.0288;
kb_minus = 0.3859;
kc_plus = 0.0018;
kc_minus = 0.0001;  

ka_plus = 1.5*(Cai.^n)*1e12;
kb_plus = 1.5*(Cai.^m)*1e9;

if(RyR == 1)
    trans = ka_plus;
    if( rand1 < trans*dt) 
        RyR = 2;
    end
else
    if( RyR == 2)
        trans = ka_minus + kb_plus + kc_plus;
        if(rand1 < trans*dt)
            if(rand2 <= (ka_minus/ trans))
                RyR = 1;
            else
                if( rand2 <= ((ka_minus + kb_plus)/ trans))
                    RyR = 4;
                else 
                    RyR = 3;
                end
            end
        end
    else
        if( RyR == 3)
            trans = kc_minus;
            if( rand1 < trans*dt) 
                RyR = 2;
            end
        else
            trans = kb_minus;
            if(rand1 < trans*dt)
                RyR = 2;
            end
        end
    end
end

end

