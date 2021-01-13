%this class generates objects which are the "characters" in all later
%applicatoins the contain all info about a special character, which
%either have to be entered or generated from class_info.mat

classdef charac %needed input arguments for methods (name,at,lvl,RB,W,DB,tw_handed,cn) = (Charactername,Attributelist,Level,Armorbonus,Weapon dice [a b],DAmagebonus,twohanded y/n,classname)
    properties
        %properties wich have to be assigned by input arguments and are
        %"constructed"
        name 
        at  % St De Co Wi In Ch
        lvl 
        RB  % all except dex
        W %weapon dicce, array of form [numebr of dice  kind of dice] e.g. [1 8] = 1d8
        DB%damage bonus, except strength
        AB%attack bonus, except GAB and strength
        two_handed %1 if yes, 0 if no
        %properties that will be constructed
        mods
        clas
        GAB
        HP
        RK
    end
    methods
        %constructor
        function c = charac(name,at,lvl,RB,W,DB,AB,two_handed,cn)
            c.name = name;
            c.at = at; % St De Co Wi In Ch
            c.lvl = lvl;
            c.RB = RB; % all except dex
            c.W = W; %weapon dice dice
            c.DB = DB; %damage bonus, except strength
            c.AB = AB;%attack bonus, except GAB and strength
            c.two_handed = two_handed; %1 if yes, 0 if no
            c.mods = modi(c.at);
            if strcmp(cn,'Fighter') == 1
                c.clas = load('classinfo.mat','fighter').fighter;
            elseif strcmp(cn,'Druide') == 1
                c.clas = load('classinfo.mat','druide').druide;
            elseif strcmp(cn,'Monk') == 1
                c.clas = load('classinfo.mat','monk').monk;
            end
            c.GAB = c.clas.GAB(c.lvl);
            c.HP = (c.clas.TW + c.mods(3)) + (c.lvl*((c.clas.TW/2)+c.mods(3))); %HP with the mean of the TW
    %         c.HP = (c.clas.TW + c.mods(3)) + c.sum((c.randi([1 c.clas.TW],c.lvl,1) + c.mods(3))); %HP with random TW
            c.RK = 10 + c.RB + c.mods(2);
        end
        %attack
        function [A, D] = attack(c,type)
            if type == 'full'
                n = ceil(c.GAB / 5); %number of attacks
                dice_A = randi([1 20],n,1);
                AB = linspace(c.GAB-(5*n),c.GAB,n);
                A = dice_A + c.GAB + c.mods(1) + c.AB;
                dice_D = sum(randi([1 c.W(2)],n,c.W(1)),2);
                if c.two_handed == 0
                    D = dice_D + c.mods(1) + c.DB;
                elseif c.two_handed == 1
                    D = dice_D + 1.5 * c.mods(1) + c.DB;
                end
            end
        end
            
    end
end
    