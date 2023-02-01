PGDMP     #    #                 {            Overnews %   12.13 (Ubuntu 12.13-0ubuntu0.20.04.1) %   12.13 (Ubuntu 12.13-0ubuntu0.20.04.1) (    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    41241    Overnews    DATABASE     |   CREATE DATABASE "Overnews" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE "Overnews";
                postgres    false                        3079    41242    fuzzystrmatch 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;
    DROP EXTENSION fuzzystrmatch;
                   false            �           0    0    EXTENSION fuzzystrmatch    COMMENT     ]   COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';
                        false    2            �            1259    41253    ARTG_CATEGORY    TABLE     �  CREATE TABLE public."ARTG_CATEGORY" (
    "ID_CATEGORY" integer NOT NULL,
    "CONTENT" text NOT NULL,
    "CREATED" date DEFAULT CURRENT_DATE NOT NULL,
    "UPDATED" date DEFAULT CURRENT_DATE NOT NULL,
    "GPT_ID" character varying(200) NOT NULL,
    "API_ID" character varying(200) NOT NULL,
    "QTD_SYNC" integer DEFAULT 1 NOT NULL,
    "QTD_MATCHED" integer DEFAULT 0 NOT NULL
);
 #   DROP TABLE public."ARTG_CATEGORY";
       public         heap    postgres    false            �            1259    41261    ARTG_CATEGORY_ID_CATEGORY_seq    SEQUENCE     �   CREATE SEQUENCE public."ARTG_CATEGORY_ID_CATEGORY_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public."ARTG_CATEGORY_ID_CATEGORY_seq";
       public          postgres    false    203            �           0    0    ARTG_CATEGORY_ID_CATEGORY_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public."ARTG_CATEGORY_ID_CATEGORY_seq" OWNED BY public."ARTG_CATEGORY"."ID_CATEGORY";
          public          postgres    false    204            �            1259    41263    ARTICLE    TABLE     v  CREATE TABLE public."ARTICLE" (
    "ID_ARTICLE" integer NOT NULL,
    "ID_CATEGORY" integer NOT NULL,
    "TITLE" character varying(200) NOT NULL,
    "CONTENT" text NOT NULL,
    "PAGE_PATH" character varying(200) NOT NULL,
    "CREATED" date DEFAULT CURRENT_DATE NOT NULL,
    "UPDATED" date DEFAULT CURRENT_DATE NOT NULL,
    "GPT_ID" character varying(200) NOT NULL
);
    DROP TABLE public."ARTICLE";
       public         heap    postgres    false            �            1259    41271    ARTICLE_FILE    TABLE     �   CREATE TABLE public."ARTICLE_FILE" (
    "ID_ARTICLE_FILE" integer NOT NULL,
    "ID_FILE" integer NOT NULL,
    "ID_ARTICLE" integer NOT NULL
);
 "   DROP TABLE public."ARTICLE_FILE";
       public         heap    postgres    false            �            1259    41274     ARTICLE_FILE_ID_ARTICLE_FILE_seq    SEQUENCE     �   CREATE SEQUENCE public."ARTICLE_FILE_ID_ARTICLE_FILE_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public."ARTICLE_FILE_ID_ARTICLE_FILE_seq";
       public          postgres    false    206            �           0    0     ARTICLE_FILE_ID_ARTICLE_FILE_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public."ARTICLE_FILE_ID_ARTICLE_FILE_seq" OWNED BY public."ARTICLE_FILE"."ID_ARTICLE_FILE";
          public          postgres    false    207            �            1259    41276    ARTICLE_ID_ARTICLE_seq    SEQUENCE     �   CREATE SEQUENCE public."ARTICLE_ID_ARTICLE_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."ARTICLE_ID_ARTICLE_seq";
       public          postgres    false    205            �           0    0    ARTICLE_ID_ARTICLE_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."ARTICLE_ID_ARTICLE_seq" OWNED BY public."ARTICLE"."ID_ARTICLE";
          public          postgres    false    208            �            1259    41278    FILE    TABLE     1  CREATE TABLE public."FILE" (
    "ID_FILE" integer NOT NULL,
    "FILENAME" character varying(200) NOT NULL,
    "SV_PATH" character varying(200) NOT NULL,
    "MIMETYPE" character varying(30) NOT NULL,
    "CREATED" date DEFAULT CURRENT_DATE NOT NULL,
    "UPDATED" date DEFAULT CURRENT_DATE NOT NULL
);
    DROP TABLE public."FILE";
       public         heap    postgres    false            �            1259    41283    ASSETS_ID_FILE_seq    SEQUENCE     �   CREATE SEQUENCE public."ASSETS_ID_FILE_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."ASSETS_ID_FILE_seq";
       public          postgres    false    209            �           0    0    ASSETS_ID_FILE_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."ASSETS_ID_FILE_seq" OWNED BY public."FILE"."ID_FILE";
          public          postgres    false    210            1           2604    41285    ARTG_CATEGORY ID_CATEGORY    DEFAULT     �   ALTER TABLE ONLY public."ARTG_CATEGORY" ALTER COLUMN "ID_CATEGORY" SET DEFAULT nextval('public."ARTG_CATEGORY_ID_CATEGORY_seq"'::regclass);
 L   ALTER TABLE public."ARTG_CATEGORY" ALTER COLUMN "ID_CATEGORY" DROP DEFAULT;
       public          postgres    false    204    203            6           2604    41286    ARTICLE ID_ARTICLE    DEFAULT     ~   ALTER TABLE ONLY public."ARTICLE" ALTER COLUMN "ID_ARTICLE" SET DEFAULT nextval('public."ARTICLE_ID_ARTICLE_seq"'::regclass);
 E   ALTER TABLE public."ARTICLE" ALTER COLUMN "ID_ARTICLE" DROP DEFAULT;
       public          postgres    false    208    205            7           2604    41287    ARTICLE_FILE ID_ARTICLE_FILE    DEFAULT     �   ALTER TABLE ONLY public."ARTICLE_FILE" ALTER COLUMN "ID_ARTICLE_FILE" SET DEFAULT nextval('public."ARTICLE_FILE_ID_ARTICLE_FILE_seq"'::regclass);
 O   ALTER TABLE public."ARTICLE_FILE" ALTER COLUMN "ID_ARTICLE_FILE" DROP DEFAULT;
       public          postgres    false    207    206            :           2604    41288    FILE ID_FILE    DEFAULT     t   ALTER TABLE ONLY public."FILE" ALTER COLUMN "ID_FILE" SET DEFAULT nextval('public."ASSETS_ID_FILE_seq"'::regclass);
 ?   ALTER TABLE public."FILE" ALTER COLUMN "ID_FILE" DROP DEFAULT;
       public          postgres    false    210    209            �          0    41253    ARTG_CATEGORY 
   TABLE DATA           �   COPY public."ARTG_CATEGORY" ("ID_CATEGORY", "CONTENT", "CREATED", "UPDATED", "GPT_ID", "API_ID", "QTD_SYNC", "QTD_MATCHED") FROM stdin;
    public          postgres    false    203   �0       �          0    41263    ARTICLE 
   TABLE DATA           �   COPY public."ARTICLE" ("ID_ARTICLE", "ID_CATEGORY", "TITLE", "CONTENT", "PAGE_PATH", "CREATED", "UPDATED", "GPT_ID") FROM stdin;
    public          postgres    false    205   �8       �          0    41271    ARTICLE_FILE 
   TABLE DATA           T   COPY public."ARTICLE_FILE" ("ID_ARTICLE_FILE", "ID_FILE", "ID_ARTICLE") FROM stdin;
    public          postgres    false    206         �          0    41278    FILE 
   TABLE DATA           d   COPY public."FILE" ("ID_FILE", "FILENAME", "SV_PATH", "MIMETYPE", "CREATED", "UPDATED") FROM stdin;
    public          postgres    false    209   �      �           0    0    ARTG_CATEGORY_ID_CATEGORY_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."ARTG_CATEGORY_ID_CATEGORY_seq"', 86, true);
          public          postgres    false    204            �           0    0     ARTICLE_FILE_ID_ARTICLE_FILE_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."ARTICLE_FILE_ID_ARTICLE_FILE_seq"', 1, false);
          public          postgres    false    207            �           0    0    ARTICLE_ID_ARTICLE_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."ARTICLE_ID_ARTICLE_seq"', 87, true);
          public          postgres    false    208            �           0    0    ASSETS_ID_FILE_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."ASSETS_ID_FILE_seq"', 1, false);
          public          postgres    false    210            <           2606    41290 !   ARTG_CATEGORY ARTG_CATEGORY_pkey1 
   CONSTRAINT     n   ALTER TABLE ONLY public."ARTG_CATEGORY"
    ADD CONSTRAINT "ARTG_CATEGORY_pkey1" PRIMARY KEY ("ID_CATEGORY");
 O   ALTER TABLE ONLY public."ARTG_CATEGORY" DROP CONSTRAINT "ARTG_CATEGORY_pkey1";
       public            postgres    false    203            A           2606    41292    ARTICLE_FILE ARTICLE_FILE_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public."ARTICLE_FILE"
    ADD CONSTRAINT "ARTICLE_FILE_pkey" PRIMARY KEY ("ID_ARTICLE_FILE");
 L   ALTER TABLE ONLY public."ARTICLE_FILE" DROP CONSTRAINT "ARTICLE_FILE_pkey";
       public            postgres    false    206            >           2606    41294    ARTICLE ARTICLE_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."ARTICLE"
    ADD CONSTRAINT "ARTICLE_pkey" PRIMARY KEY ("ID_ARTICLE");
 B   ALTER TABLE ONLY public."ARTICLE" DROP CONSTRAINT "ARTICLE_pkey";
       public            postgres    false    205            E           2606    41296    FILE ASSETS_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."FILE"
    ADD CONSTRAINT "ASSETS_pkey" PRIMARY KEY ("ID_FILE");
 >   ALTER TABLE ONLY public."FILE" DROP CONSTRAINT "ASSETS_pkey";
       public            postgres    false    209            B           1259    41297    fki_ARTG_FILE_ID_FILE_FK    INDEX     Z   CREATE INDEX "fki_ARTG_FILE_ID_FILE_FK" ON public."ARTICLE_FILE" USING btree ("ID_FILE");
 .   DROP INDEX public."fki_ARTG_FILE_ID_FILE_FK";
       public            postgres    false    206            ?           1259    41298    fki_ARTG_ID_CATEGORY_FK    INDEX     X   CREATE INDEX "fki_ARTG_ID_CATEGORY_FK" ON public."ARTICLE" USING btree ("ID_CATEGORY");
 -   DROP INDEX public."fki_ARTG_ID_CATEGORY_FK";
       public            postgres    false    205            C           1259    41299    fki_ATG_FILE_ID_ARTICLE    INDEX     \   CREATE INDEX "fki_ATG_FILE_ID_ARTICLE" ON public."ARTICLE_FILE" USING btree ("ID_ARTICLE");
 -   DROP INDEX public."fki_ATG_FILE_ID_ARTICLE";
       public            postgres    false    206            G           2606    41300 !   ARTICLE_FILE ARTG_FILE_ID_ARTICLE    FK CONSTRAINT     �   ALTER TABLE ONLY public."ARTICLE_FILE"
    ADD CONSTRAINT "ARTG_FILE_ID_ARTICLE" FOREIGN KEY ("ID_ARTICLE") REFERENCES public."ARTICLE"("ID_ARTICLE") NOT VALID;
 O   ALTER TABLE ONLY public."ARTICLE_FILE" DROP CONSTRAINT "ARTG_FILE_ID_ARTICLE";
       public          postgres    false    2878    205    206            H           2606    41305 !   ARTICLE_FILE ARTG_FILE_ID_FILE_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public."ARTICLE_FILE"
    ADD CONSTRAINT "ARTG_FILE_ID_FILE_FK" FOREIGN KEY ("ID_FILE") REFERENCES public."FILE"("ID_FILE") NOT VALID;
 O   ALTER TABLE ONLY public."ARTICLE_FILE" DROP CONSTRAINT "ARTG_FILE_ID_FILE_FK";
       public          postgres    false    209    2885    206            F           2606    41310    ARTICLE ARTG_ID_CATEGORY_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public."ARTICLE"
    ADD CONSTRAINT "ARTG_ID_CATEGORY_FK" FOREIGN KEY ("ID_CATEGORY") REFERENCES public."ARTG_CATEGORY"("ID_CATEGORY") NOT VALID;
 I   ALTER TABLE ONLY public."ARTICLE" DROP CONSTRAINT "ARTG_ID_CATEGORY_FK";
       public          postgres    false    203    205    2876            �   �  x����RYE�������G� �_ 0/���ܧ� )!%��o�{�Q#G�~������+B� '6����s��)��y:����q�̚��{��?��{��򴗚^l���o�k���s;��^��g��n���*N� ��~|����y�;z1~{u6*����O⡶����R�$QA	"%�8&5aB���?�ʊU�T��|V�@\�'�5������[;X������/��f�ˋ������p�������/�l��>K�fx݈wVV�e&�9ʤe��ҽ���b���Uso�.�9�ֳfS�>�]></ڣ�;�*��ϟ��l�E"��D�≣����%�\��;���f�a���c_O���D�rɑ"3���2�� 5u.H�
��ި�&�7����1��M���/G�.��ޜSzX�]����E�U%f�$&�����@�dVJS�(�C��m�|EF�C��=W�J֜hSp��Z���+����i�U��Wht11O�G����F,�ӯ�۟�6��Uq�e[�: Z�#^8EB��ܿ�Y�ꨙ5�֗گ�ݛϖ�����?H��Ϸ���Tm���iz���=�a�.�P�Yf	U"�����wxQ]/�H�k�_3~Ҵ�̓��7��Ke',1E$����a^f��*)�v]V�8�P�`?>��f�Y{~�t�����/��x\��vX%��v�c$2+Tk�%Eq����W�����_��Ϗyd.�Fk8Zg��L�rȇ����9��Se��f5Q;�"��� 	0�	,+",��g]��V������h�Tk��y
��諈�IF}���kZ��ǻ��d�� @*DR�}	�`�T�&[G�P�1�ûz�N�L-�8ҨW
$4	!3B9�)Cw���W�mד��d�~ʭ��@��%�le
�h2��b_���h^���,�,���zR�.B�bPY�A�Xj�IiK�Gi����/l8�O��l��� 8,?HNa!����8�a&6J������_Or�i&��\,,r�f�TN�g<���B36]�Vg�s?H�h�=,i�$ƄV&�VJ[���l.�+���p��6�c�=ͤ�����t��iE�aQh��7�U�F���ӬONy�	j�����{�%¥����n���zVO���!,a��v�6�N2-#
uq���-���ⵥ���>O۳^CQH����_F
�l�KV{��N�L�Mk�tzv�������������M<�^����_��c֣RZ�_8B�R{���>0|ZT0<�i�ԋMĳ��7���Y���r�'����[^�l-T��lWV�B������bPю���<��0h�C��D$D)i���M�Qq��5<��8�m������K���S�~��п�~�z�|yx]������_qF�EBvC?%+P2r�A�`�2�q�Elf�I=j6��ϐ�ADτ�"���@�L
_M��1���,��܉M���p�p�g�O�#?�]S�8i����]%M�9y���
�B`]T�3X�ղ�s3�G�(��8b[�p�!���#���K�:����slV6x0oq�9[�>� sO㗯��a������4�?~��0�wmU��T%O�+p`��Q�R��ƚ�N�l�$�ߧ���8mZ����ͯ'oߞ��2i��]N�ǲ�<���ú�dW�-�"�F�&��������_!�hIP�!��F<�7)�M��U�>����o`�z�� ����l̓��pX���=���-^3G��ba��SR�����qc^�Lu���&%\6.$��V��q���=�hV��U{�A�.����;C�e�����2C�S������oh��DF�S�����fI��#ѣB-����[���M;σ�z6Og�?������[][tQ�34V	$�̂��x�.P���w��?��{�����W�(�E��=�@P�T�E|���g�c�l�F�ȫ_0�U�Z���$!�8N�x�vPW}�VK�tA؆o��b��M�O�Q�������y��^�`U      �      x���˒W�%���T��C�"�)A @��IRzs����@7�����U��ddV���IV.J�"X�z�������sT��k� ��!]�$�w����ѣG?���KG�]٬���b���˪^�ϊ�m����+B�2,�U�U���yQVţ��/mq�Pm�f]uE[��e߷ť������2+���C-��e׷MX�M_ԡꋟ����7�P,��v�O>mO��6e�ȟ�OVM(6�������/�vѕ�|H=+B]��UY�EW��mӇE��V�GW�ǡǋ�󶫲������V����Q�,Cs�����;��xR�۲ݶZ˛��y��ޜ��6롖�)�ȫU�m�U�k������ޔ��/X������_�H�<������V�.7'�<T(v�rW��G�iW�e����O�bA7�7����ZV}��m��Q��l����-���D]b[Jy�>Wm�8�S_�ʳ������Mu\-��rd�do�E��۶V���%V
$�.�|8tuY�O�+�[�A��6+�`�~?>K~�j�eW���]�����o�YW��o�<��ÿ5X���./d��򨕼���'�d��3��Sy,|�@׫l䉱�����+���NN(~iY�*y�'�4`9��\p	q�\ʫ�����~���
<�|ֱl�F^��S��$ /�ǫ���P�7Ú_Z>z�c~��]�����K��A�}[��ʣ��|��T/'|[m,q3��T����s�/<�M�Z<(�S��-N��%O��a������z�<�+�G�.,���i��P�ʾ�O��qA�t8��o]�,^�$�활��_�r�g�ג�w����<=O�F��UU�3��� _p��ǫ�������I��4/�� f��]�.eE۞�,{�MY/pTt���b�ּ9��o�*�a��+D�^+Z"9�����/W�gm��">P����)�[*�F�P��/3���^Y������6�D�00HjG�w,�q�bF���شͺ��Y��|w�	�޺��b�L9xxV����q��8�.~�=.eJ�ԩ���ӫ�..WK��Hÿ����-�J��C8��Ln��N�n0�dl��h࿋�m�����c1e���r�z�Z.����}\8X9�vȒoɏe�Gr#(�z�#���#��+$w�^������#��X9��aqyK�n{�n/[-�l1�K<���ˑ�����>W����D��؝��Ux~����U�Z�Z~��p*����}ʏ������-��z�����64t�v��.���W�bf/b8g<+l&DW�	`E�;y:�RL��M� �,�lu��=�~��d屡�jYQ\ݴ��}�I|R��1Lh�޴��`W��K��j�v�ui/
�6��Ł�<V�J:0��35<c�)��!������*n���0�%8��&я7ț��(]
1����{|.���c=�a#���������_6��۹}��ҍk7nί]�߼���R,��v������?�w���z��{v�÷��N�?����|��K��"�i��/�V>��j?+�CvԜ����E=�[{�[�H"�!�����蒊�_W4���8r��0od����WtՃ���a1��X�k�׸�r�i��_���e�ʎ7z�q�z$rLqD��Ufqb��^�����Rr�-�.�B�lqbov��F�"�6��������UDc�E���5�i�Dv��&�,ݝ�Ɨ8�+��͉|<��<b���A�P�>tb߫SƸ;��V�z��O慖3;���X5Q~��oo{;'�	��ׯ]�V��޽]���N��k�#�bËj��k5�%�bU�5��V���=��+/Ӆ���ϟ}$=�,�	b��Mb_ܗL�MY�+yf.����{�(U�,V��בk���d��}�x�{`/�����D�����W<�3���/�0ӏf��w��<��h�8z�$�#k�����a�!w�s��mpt���ڽON͢xqR�ˎ���E��	�~ID���,^~�3ʔp'�w�Z���Y�N�� ��W41saH��?p�p���{k���b7�]�Н\�s�Ĕ���V�&�䧇7���;�:��C�x*�Y�j�����0rHd�v��t�ä��Ք?ޞ���7�5U��uq�k��'�F��+�2�3K���7W�g�z�e��h�J��@�}#O.剜��1hSb_�����.��e�6l���pݮ,c�=f�P�4?`��	�?�}K������/��U����R�-��հ�s+)��:c�(ٗ��
g=�#e}�
!�q��p	��,�
ɯ�Uy�+�Z̩��.���8o'�2�:����{��w�5Sd|��%��t���CY��㈗�Z�a��,n|�b�$��W~GQ�;dD��S��_|��.�-�������S8Fƀ�ɓ��G]-�嚭T-Vr[�V3[��i���\z����Ak�K�z�����)D���:�h4�a�"�L�x�<���J��%��N��xǚ������h4(�q�ֵ����Y�c���n�UE�pz��ͽ��(&t��Y��?��W-ީ9���Tr���-qWA��ee����ɲ���kK��K^��O���_�Џ�oۿ�#h����Y�	KN%2='&��%�6V6���ˢ���沐� {-1�_���~(���������c����˻���~�h����Ǘ�_G|�Tb��H�>?��+����?(%l�4�|�~Ђ����ճ�����nGH?�<�(�N���W^�l*d�t=�P�C��%��;?+�<M �M��xp-�C�c�ՠ�ӮK�ѥ�U�`!,�Bl���æ�����#?�s��d�3��u����%������	��}W�\���Ĝ�2�0P�2w^E�^�r��x��}��I*��Fl�
m2؊�$c�~���*Jk!K��'�t��G���)W�O(-Ƅ�����I��EM�Q"g��������#�:t姻M��=���Uq!+������,��vAl� 	^̘�B�+���|f�Η�v �h�1 ��C:v��k]�n��˒жؗ��/�a�j. I{����J���V� 
�P~�6��F;R1�&]�ef'N\�qO�R��A,�k#h��	�K+yG�H4�Qb�;w�bq�}�d��B�4XE�q0(TV��2��	��U�QaZ�V���,7�p��Q������kå"�
�f'�C>0t"�m⩜��r�d+Dt���X!A�?,�� b{����_�@_�M�A�/�`b�W�$.���ȏ5%@����":}.^d�wzvp��Akz��^"b�b�*��ut�����2 ���ۣ)�{f�ՆB������ў�9�(�� Ww����0�3�k������Nͪ<%ƴ-kϵ��@	ާ�V�4f�'�M����qt�^K��J�ψ��L}�9�����@�DzTD�8-�������Y��D�-䥱Yv
����,���4{���ē�}�1��x�|��a�w&��<��68��3@�^j����x+�mY�R⬹|N[}0��o����ͣ�~z���ӳ'/�Oo������o\�-�U�%1s���2t�U�Ya��US����3p����b+���Jk�%���.=La�ҐXa�6^��E�q��-9����3�G,�{>���wf�(��'�Ʈ��%I�߯��5HTƥ�b{�ך��\�U0z}��_�����$D�+z�xF+ ��� $�C~�Ŗ36�Vo&/!���C" V��>�{������c�N^��_/�T�J���D�i�a˳r���d��%��x$.�x$Vm݄+yg�*|U�����[�>g���)V�	�$�;�c-�h�W�e�r��n���%��I��"5�.��a��E���b���f�'0o
7�"ʯ��N��8���G�u��UU*,���\�q�=}M���1�P��4I��SX�*x�;�"��l]R4�1g���� ~�HȆ��H����'E��&�'��}>��g�h�V��V�f��Ȭ    s|�h��Y�F�������!�鵇-z=�)#k�ҹ^��,y��)Q����Z��0��u�Qq�^~uI����C�4�x$ױ�"tk�6��IT����&H�P�����i$��6�nyQ�q��-��.X�q$g�
��mK���Qv `̀�gp@ݟ1{�P�o��{`'?�=�����-޿&/�L�)/�."�!w�.Gf�~���~��#��\5(�a׊Ӑ]B�b`��KH$����p۰�/B0��3
w)`6�n<k���	a���X8ћ���l�0"���?���VZ���p����Ssv����8��.ɇ�����m�?�䛣�}�y��ۧߞ�������7��߄3��*���^v#��k�h����9�����墵��G�I6�5��.�����N����q�ٱ6�:�J#kX:$���kj-

�pV_U���.!�`j�*�R����%a���_��#�i����&+��uV����J����0������YXˁ:Rq��
�8,�q���mn�^UҰ;��O�f��!
q.$���/��\�������qQ���Rs(�&e=���� �u���檫4�?b�j�>Unh�R�����,�X��j�@��},�Lg�@�$�K����z-q����?�/J`�:��)o �$�Zf�	�Pyਬ�	�y�Z>5Ғ�w�"�B�q�ٰ̔ϒg+��O���5�,���Jcņ�:0�vif�]r���a֎7%�/d��vV�=P����H.�Rd�>;�g�=�a���xЕ_|���7��l<�4˫�^�s'e�x���%�:������F�i��L-QV���6�GճOB�MA	�8�ւ���e��ۺ�z�&��IyH��ސ�i�w����Y�T{�Kr�Q1^�fPΊ�[�ߌu���*?��zX=��iĆӃ�W��s��r	*��2���K��TYl�c&̩�T5.��y�y��C^�?Z��<9�v����0d&~SNLB'֗y|�H����Q '�����(�
�;������O_��f�EU=X��w�޼X~~��-8�x����>���p��O}���3�[�;o�J��gށ��q��?>��������hp�!��?q_��핖�5�?GH���KeAY��ݧ��ˆ]�
����n��h�Sl�o��9�	Ǝ�FC.�F���92��_6-8K��Qd���Yr�7l�x��X��ڢ�4��+����& Q�,X���hP���Y�����rM`�)ūTggL���G �T�M9�$FC���%��)�%�լpb&�Ƈ��dSf9_A��1*�Q����ը�v�y���=�z=̏���*0HT�	+ß����1�H�a:0�ɻo��V����7���G �NY$��Z~ܧ��L�ߺ*Ǭj�'��u+?�m	T%�'7���x9%�+�q�,���.k���9�.:��O�e�}I�F$�[/A[����|�]�2�vXN�/�wfi��] ��̶�
����́ۅ`��7/���%ta%��dnE�2Y~�j�+��%�Ir]U��Q���r.��s�πt��'���5������z~�z��Q���I�s��F1)~�Pry[���}[�[�.<�W�Z�F�����l,���h�(چ/\��+е��W2�mD;�КZ��b�,���%�*�6�s[��ڳ��_mo�n��ǧ��|�C]��_�$����K�2)G�+�թ��]M�Uz���X��)�L��&�P��o]#T=s*~�ҁ'��@X�CO[�� �4z��PR���U�B�v�rG���⋘a���Q1�B�pW��m[�	�Z%Z�b�rk�^�(K֕�%M2��*�=�e�W��G9S������K�&����L!Z,5��;�ۙGZ�\��3ܭ4��:�}��'�1 ��di�����"q�
�������=��Hl-������S��M��`z,�pe���X�8M(��d�f���r,�|ā��h6ct�Ŏ�UYȫ��H�$���l��x��LD�=\5�7�d9b���[� ����d鋓,"��X�^�л;�����5!�2i�Wդ�h�Wu�E	�Tn�oY��D�J�N��@�W��}��X���6��sNBfo�_�؁:���:#$��W�̚��iF�Zuvl�b0�K/8c=�i����D~+�&v ��U��Ŋ�W��ߦ��P�ȤCY���.Ƨ��f�  kt�"V��0����"����-��i?��2i���׌����4��J����*��r��'�^�My̖))��BDbw��K��璒��W�A�>�?=<}�=�y�|����׻��'__��������&l/a(:+X3�/�~���wd^#��ؼ�c�<F�uY�{�Mˀ4q3R��b��.T��$O���nmvP�)GѺ�;�<ȩf�Z���*E�V�TGJ}ű���f��x�-�{ϠAw~�����w�]����Z|�vH�NK|/5'�و���%:��k�;��6�VEC<����9Q;X�]H����jM��	Y�6��	-�&�c�)�Nc!p�|�.|�.�#��d��H���a�AvE�<v�)_��*	�/�w�ӂ�fڵ�d�Oqzw�F�˿��˯4�+�n���b�=U0�6����H���N�XFK�����+�K��K�g�l�D����T������y@SR�#`��s����z�>N��J�Z��2��B
��/ � ^s�L�]�8�U��?�
i�b�'�uinupi�l˛�W�MF{/��z/P�KN_�����®����m�W</�8,V��ê���6U�7��F�bk��V��!5V_x�PGF*��#m���r(�)U�ѯ�c���>���hY��$Y<����ЭR���<����k�v�+�a�n�Դ�s����?��ʪ���W�#�]
�<��s���|���߄�������߾�f8���ѫ��?�绫�C�_m=:<rH^�W�c�y�1i"�\�"�Gy�ˈ�ub�A�F�q�ƹ���F��^�`�b�Ny��$��
�D����D:e���aB�����&�xu���Z#t�E^�����	�*RsoT�ە�O�%�-;*	u�.I4DmI����5��"
ݚ�a��sf���c�##Y{�{�B%̑�$���#VC�Ы:�W˺CSE��P�o��A�|u��Z؁� ^9��Q�P��ꡘ��jwUP��d�ѨS��8+�Z�8��gE�e�}u�i/B��Օ��3u��p�)g�~������{�.�g̖~��=�j��d���F��v3[DVÍ�mW���t8�j��I
(/�G��
Va�s�)�`YDD>�T8��Q�$ǎ����B����x�s[|]m������h��������FH�`c�3���Sb�O��,��[��']�����m�R�[�S�����n꽊a|�\G�w�ԗ"������4�9|Vb;+*�U<9c�B���ޮd��_�/��8��堆�{^�Y�K5�9��F�`�e.!0T��՜L5@{���'Ǩ����`F����H.����8����B�C�6��������P����(���Z��M�g��l��lbr���+(��GH��#�+)�QuGU�+9��	'��j@�~/���wX]��/㾜d�T��F���1O�X+���3o>'v�j'�}������Ƶ�I��K�*���^eȻ2��"���c���%�~$5�<@�j�ѓ)_��t<���}��������o�?8�n�I���g�����a�@���A]�c<�+U;��ɞ\a�������/��K9��}���@n-��H��>�,�)�?ߛj�e�`4į�[*!O���W<�u��h/ἤ����ϼ`_��OK��6���D]��}�u���d�nZ������gij֛e`�i��7�G�(�HcB忐�0��lR�'q�C�k!}�k�`X�_f�$��#��6(��E�ê"���Nz�A'/���#9U��v<kZ�!җ8z�,����_-�uL>�"��     �1(���Y�i�O<����!u�|g;�*�T�͠d4e����2�:�c��h���ZQ�S�>�F�CW���C�5�\�ѢQ����r���a��aP�(��n�� ��t'�b?�eQ�BLsU�8DO[z�.�s�.�푋��(&��������-
�����>�qޮP���;�?uΚ@piUi�7]���:/dRG���ʈ�s��h���Q�h��vl��-�HF�#n��x��J��;(���>8���r�
p*�0�Y,v~�ҕԆ����{�$�Xٱ&K�W���zU ���x^���+٭댆��ձ
y���� ��ơ�������[/^��&J��m�\jVu�CD�h-g9&�'�vr�6��a!���p�jz���Z&��@�x�Pz�I~�/ʖ%�1�K�B�y�����RK��{�a@���
^��Y����g�/�ۯ��w>}r��~~x����j����N�{!b������>��%z��wk3C}�2�#��$Q�Yn,�P���KeFl:DY~l�q^���N��
�IsΕ)H��٭%�V�����i�Ȃ;�ut\�ɑB�,����mf����2�����r�
���3����1����%y�Q}�19δM�+��(��%�5��Tz(&Dqi(�p �2L-�Eluv�,.�'HO�ļ�TY�ua�X%t��b� ��y�kQ˙�	�*��7N���@��/ֆ����)��~��%�a8XTdM~hܼ�(V�=�Q�=[1}�	��E. �6�
0YV<Bk�P���������`X���7���$���\�uOD���#x��f`�W��J���E(܁���q\I�*o%)g �[�c5�{�����r�%|�Q��������6���D���kݘ.���LNZ�#��EE%�4��K�ٓ��fB��Z�O�g�=K=5��hm��1pU�+HPQ���_�����<d̶j'�O�:K V�fD�ȼ���P93�$c����M/�������k-,U��@�\������o���2�s��	�o���ͥ����L���u@�tD�{jxG^�vEc�x <��)G��n�䆫g`�C[��Bld�mzŧ�[V��re'�u��D������qSz3��+�&�1L�����l��ogm2�Z��\ ��#0&/.�1�};)�o�0Rܕ�4��t�Å[|�--5� ��B�q��a��/�7uڝB�[��w)�#=f�H(j�9����a��[O��_?\?��:�w����?��7�]��������忈czY�����j��ST�pEY�W��?��ww��(��l���_��]����o�W�F��b�~�sV3EUU �U� {��b�����m�Z��d�"�Oٿ��_�1Ũ3���̰`�hEMI��h#��NRϨ��2�:JY�"4L�*W �-���zlz�p�auU�ь�����$x q��.�LLnMTG�|5��N��LC�yY�7� ��ى�dB^\*K&�)˧��H��]0넻�P�=���߽6�N4T,�����QI?8���1�y]싐>��^��[�ZmR<Jrg�f�^ݲ���ݬռ�8 �Er���5j����-!��ۈ$��,n�7�	jjV.ÓC����>_4,���]C�'hيmqz���Wr^�0N����Ֆ�%��J������P��6�c�;�E]������<Ӧ[�>��a�8�)�Z���*���}�vs宧�G�:�ʞڷ)ɺ�0��ʖ��"�T�^�s�.	]i���^��/�p�x�ba�`R�x|>L^�=S�wA�)Y��%y���&֩-�w
딏�T ��v���ƋF�C_�@�@����6�5	��I6b�8EJ5�ve��1D=�V�ӣj�V�s4�I���T"kYh@WS.�J?�0���\'��x4q`�)$�"�����HfI�׬��WT!��6�w%h�V�Vfn���u�Job��Ii��E�W�x=Ę>�E�x�-�z=of��u�M*�����CI�j �eq���0�o��IJ��'�1KHQv�C����tȠ��}Qi���G����Ua�M&��&l,d>Ѱ��6�����Q�L�j)��v�kmk�\�G�|-Ag�< 0�s����U<�����ك�������T�/-�/b7z�������={-�~�D�M1���g[.�:	�"�2ԉG�1�����Z��F ��G�;|�/{J[�i��e��͏+��y9w�P�m@\>����~  �c�~u���l�z����]}��ŧ7�<����n�N9���3H,X~*I�mS�����0��!�"Vʝc�W�8a�,���('KQN]��KɎplz�u�9LF�6���}���x��丕�FYяc d�<3�G4��}�.MM	����O���I���(}�t�L��i������_�r��J�՛s�/�Z����kŏk�V)lԲ���l�Z��"ED�TsA�_�����|�m2Ǯ�Ew��`9�l��
F��I�����]Rg��jL����-Z��/d�V~A����%UE8sYLQ�ʞSV�R��|ަ��GKM:��ϻ7�]	4���N�H�p"ex_�>1ˏ�Uu$�L�/]<�#��E��0���������4�z�ds�\�d��\��^���uk~v䭩�j�$;����}�)P�sY�$�7-��m��8>"S��K]��B��$��݃��T� ͩ0Q���B�Nڷ.&鷵��R�|�F���������6�eZ�G�~�̏��j�dB��!Tv��[�\�Y����� [�>�>X>�J�u�`�X��p����T�-��S�x��b�|��ddxn�TH�6��d�t1ra���0T�Z@:��R��t=â��r�-��#��=��Xe��� X�����`A��S��F7Zq�QJX���|@�-����|�^��	��wsJ��4�CbkJ��f�B9o���1r��J�҇J�/o}������ͣx���o=�}Z}�̓Ǘo܀˿�C���8]Ji3ЮCQ�n��~̦P1�M�'!@����<���Vp$$�eDJ�7L�� ylk*iU�!�V���p������{i��4�}R�&F�x�Y��ú4�o(l�H����L&��P*2G���x���d�lr���ⲗ�y%��[xԎf%(�릴Z��VQv��U(���|m!t9t�)\v�W���+���}�P�Ny]}T&�<���f�ޮn8��=����f��	xp�4f����D�$yJ�m ԟA9* 6ўb?��L�h���:��<9̕2�E��Ȋ�#��½P*)%~g=H�U�XIH�<4(�֣�U�CV�	�� |�j�^��yo;� ��7��J(n~-�K�uE(ԡ�>+k�4��@:{�(6)9Y�L@b��X�B.+��bx*�����`�-��0.`��էv��S�,Z����g�Q?A��-'H�)���nH=�'�8������D�C�Ȟ^0N.IoU���m1�*;c�3�("%T9������Om^����Ol�q�=FG"$�A����^�A#jo�Upڧ�ugҾ �Ҟ��ty�X��a*�s� �bD�NmJ�`�PT��(�M�0�Rl��_�靁+�K���K��g��U�W����`�0he\&���b6Uwn��_l��m�
��S�W��b��K��J�p%���6�_�%��h�k�����u��u��C��1�o�#��>�#|8(l8ƹ��vh?�_寔��l���@�*+�%	�T�Cb��.m�펫�%�Hk:�U+��."�X�Ġ)v��V�Zb\��o~E��D V5��>k��Y3c�>���A�<�Z,��G������~���������n}���:<�����ͫ��S�?�tTܵj<�����)��8���8�w���A��$��3L)��|�H�4�z_�nM��E�&�삚&v
'�����$ڬ���/+G�����Cܨ�� �e���'Uh�58ѡ�U*Ve,2������^�eqH'3�|؝�e
HM׉g��F���})=���W    Q0�Q앀�3/FN��5�fN�����k�i�g$*�c]i�f��+Go0�L����7��'���5H66F9����)�/�l��N��c��hK�i�,Ӡ�0�7[5�Bq��~X��Se�|�jŘ� ����[�i�@)N������S�����&�r+�(�km절)s+�P������Z����(y��G"�(�������A�!DdN���ķf5&�;e�FiW�����2aZe��1r�]k,LI+�̮Z���_��?������0�ӕC�p����v&��(� �h�o��Y�������T�C��drZ�7)�]g1�y��j��v6Ϩ�gz1�����ӝ��C.h2��al�]7���:j;I6dާUL��]Y�j8#MJ;t��(ֱ��l���$�]�:�w������o�Zd�)-y���������xT�:e�?f{~�I+����O�s���ݔ�\��S��	X���[H��\������ ���{'|�����n�*�M�]���4����"��fuF����Hr6�jWz+���:���V���/ej �w<9ָ�V�_�V@qLU�/D�26[�������K�9�sB����]�lE߅LZ�������V������udw�%�B\j��&�/�R��^�Yތ�;��C�<&:+�7�����σ�={_$�+z���Fk\fE����?��-��|D�%b+��>��ZВ*w�����m��������RơӅ�UjVeª�����h�!�0�X���������ݷ�����������˧�o��g__�qSQQ1�w��ޓd^Ҏ#�3�����N���ӏ��L�/IᚙU��f$���S�q��f���'-ǰ'��&�i�ޮ+���ll�3���y?�	�|��8������gE9�J3�~z͗k�Sn�������D���DF���$��X��IЊUC�(Q��C]���5g|(�{��>�T.4XM��B�/�]0e���7�Z�Dm��r���Btj���[$�AҰ8_�����F��4M��U:��'N&�#���J��EZ��C'�%KC�#�V�T�W���&�*R:�gv啩��̱�*lmZ�R.Y�O��>�M���͎MS �a7'�L�X�RP�z��@Q����	��P,JQyD�"{^�b5���-�8b�z���J�e��~ﻯ���imY�2�:�$c�kT+�j#pIh���V$�*��s�0g�d!3�M���*��(��Z�Ck��D^(5r7Z�t�z�����'��r�^��z��=��,��jG�vh����&�&�v�ZSru���CB����T�kkD �(����*��۾�V��5	"�.k�Y���������8�5��*��8h�E��%�u�u��|9+��E� �ŏ�9����6w�[��bO�Y�B������Ly�6���j<���m�+l�D�cc���?�����۹.���̐)��9>L�O��9�W�ٓ����w�z~���Ó�����ї����ԟ�匪,�3�/�#^������=YL��jg�~d=���o������2,Ud�{a�K�4�&�G0S�PV0�;�c�H�W��O��1U��Mm���Fv'��";����1�L�/:�|A$ Pn`M��)��2�	�[��>��[c�:�>����G]���t F!�����&F��3��m��k��,a�b�H&�P�㰫�!�m#n��z������U4Y���]#����&�EX���K>Z7.9IU^���pvU��U��B�>u��/(�����ap���^C��:(ةSn�������7̍��x[�	6$�GA��j>����M�w�m!tե��������%
��]&$F4�]��}彋�Gk��j�e�&6�3�{Zo;�\P��L��|�Ō����"lP��#9�����*u�s��_258��<��k��mm)�:ߎD�W ܃vco3����Z��J*C����aƲ2+'ܞoÒ���*e�3�,��s��CɃ㓸~^��|�jҾ��f�X"�B�ٔ�W�Rd�Yf����آ�&[$��QX�S��Ş׺���<fjX��gP	�0���!�FC��8��ECt�<��!R,�x��W����vY�c�'=oL0�C.��8 /aUc͡�Z���Qm֤}��,,��4�����zxhb�U
h8-e�2�����-����C��>���A2���n#� Cc���N��.�����ض5��WI�{z{'�@D�!P���vl��.��)�x�-�i�{֞�~� ͥL�D>����������AB?���y���6�͵a���߾���͛�w��͝������^��1�=�?;�qS^��{����\����?�W�GX:�k"�M�r��o�j|+2���^�S�g��4  d��i�����������;ݲ=ZfX���e��n6n�i3fV��@��Pt|1Uir�TG��m"/��FZ)G�"
�/����h�6��կ,��b�V+"���X�K���'�9�K� �7�j�P6�K`�Ea���.E7Z.Env(_t��S7�^�@��փ4y��:�W����)�����ݡ-�v>z��I��S���8(73��6#�����Oڐt[���������C�x�p�m����8 qb�Y���
��1��ز2m��W��$��耧��b���0�,J��=^�t��e-��v=��.j������c��O��Yh���θ/y�o`��x��$9�����.F
��@+�OD����2���juQ׽l�'Ȍ�QJ�FS�z���b����nƇz{s�x��.�Y4�H�%u�l:���]{��D�ޛ�U�ŃuS�_��Ρ[�Xs�
�-É}��C��Y'/��ɼ7b�L<WB�m��O9��C�,��A�kf
�*�Vt(Dw^��Z3� ���TC�a�F1V �t�-�`��� Gs�:u�\@43 �U�F��!��9pNLy�q0v�t�z�>�S�a}h�<�胁Y�;�q���n��y����?������W����������"9�G�6� \#z8E߾�z��qdE5�$�ªc�q�޽=�%PgEތ���@��vu��6r��2����Μ�ë���U�ڼ�jr���g#�C~Ҏ�@�3{S�^�qP��>::��Kl~����9Ō�Q�s�G� o���}�����p�[o���Z��ee��2Ƕ�·X%�3�_���k���Vk{��57S ���gf��9�!�:�J�yo��{x��"�)(�D�.�Ս�d_m��Ĕ����.�U��9��3�_֙��mf�yXc�ɊT�m�����0�V�ˆ�F���X���<�:!|�>�%��?��vz�9�죤Ԗ���۰��1�B���3��7D�2�fƘ+���T_2���5��u��d')gٜ��m��{[�T�Ph�>�d[Ɏ��$_7�[p蘍{R���A�VF� �uHa`�F*�8Rژ��+PU���NR�LE3��I�PLt
T��I�7���:�T:CA�=qԗ�H�܉�w��eY�5Jֈ���O4���5$�I��.�0kfd��M�1���/��0F1�G�$�M��6���R��u:[� ������y����~����Ϗ�_������7�o|���^�̊'`Ix-�st�(iOr��9�í�!a�o>+.n��$����l\���l���.d�����UY�PA�=xs���o%��f� ��q����]bF�1�ԫm�0xF�U~�+�h���<��O.����3+l �g��I��`���ö2P4��/���+���K���q��~_��,uz����U���$����H�H�=��`F���kF�'(Q�	��eq�:G�*�uj)Rٶ3[�?���09�^���5�FW����\k�����`��ۈP3-&�0>{	�U��#0��k������V��[�S�w����<N��p�/�������f6��$�OZI���7�Jg���'�Y����`�&,�    t����Pr1㽉K�Ji��i1�ntٓ���Sjg�LJ<��4~� �&����hm{c�mZ/̫l�:����Y,t�j`��Y��x��Yg3����:4x]n�+mU  �tѣ� �s&w��u�x�r�tl2Q2q�gT�ˀ&�}��*�V,D�?&_��N˕�Α� ��a1#4����k��v�h�)�v=t4 r�e3��� �o���i_� �o�>�$�q����(�S������P�ׇ�)��i���ύC3<g�(]�'e�B�d5f���r3~TT��#׵é���8xP��J���%�s/��
�}*w[\9��ڕ���UZ����yWlV���yD��e��Sl��DF_iN�D�I�����`6��7?������k��%�﶐���T�k]��߷���󽜖N%`��(v�j8�j�3��4s+��w�x������/1K��TΘi�n���i�A�s�] �by��p�L���K|N�s>>��r�/(�0�8i��?ތ�m�c���?~w�������\~�d�y�m����wB�
X�{=�R�'�*S	/�����X0f~�w��J�Tm���8:UF�H~@�n�P�^6���uR�H}��hdJnSb��o�0���{�tupe9�T�(w�d"kR�_��a0�O��(0��Ga�D��q���Mq�P��T0c���Q)�K0@��PjХx���b^�4���eS��v5�p�+7�.���M".5k:����30��Q���F9Yw��U1r�^E���Dm��X<��#���}{��|pG�9s��1��J����3Q����_�L�q�fӮ�Fp�"�i���HAan1cW�4Tq��N��	�����X�g�y.��C�uZHG,������V�>>j*��G%�5q���Y��Or ��̇42%(n��Tsh_�jW�0 WM�L�&R{1���M����{R�����b4����g�mn�)ft�ؤ���ʩ���`a����zc�����$��υ�p�Q�Ĕ�%���o#��v�}��K�sl��}�\�,�tO=�?&go.�E.[����ӣ�\?N�^>���VOo/n�9>~���O郭ؠr����A�s�m"�L񀿃�	X�#��ȘM������2[h=�3;.z�qcψ���9=������U�r�Z�w>V㌲n�i��z:S�0�B��R+Q7�GV�;�bIc���Ҏ$v��]�QT�u�rDۚ[�VnmF&rG}JM���@h�脉n-[B� ��_�:V�t������mLʪ��6Y%5D�_�5��5��,ֺ�	��!��:��W�U־m���W���R<����"6!���sתЍ�?T��Va��j-����js�ͪ;�d���� �Îc��8��ɭ�y�܆���rȉ�#����!��F��(b�Ӕ�-�۠�]%"�R�b�پ.�Ŋ����~[�gu�8�N#���//zL��ZEzGb�g�aJ�Yj��YH�DL� �ؠ���$�eݺ��S[�Cs12���C�xb�a���*l���F1:(FwbO�r��t�b�*�>q�i��\5r|��� �代�nԧ�����?�������w�����'���R�6A���&|����/H����@��a�e+�Tk=��8'-�O@�E?�[����Qyt�&#RuT*��Ҟ��XeB	j���Q,�]��Bx�p��� ʂ�$U��Y]Z�
E�������4��5+3{g�4N�����!&�p�J�V�/1�I�w6=�H������Y��RHl]���+!үH�?n��+d��*&o��0ٞ��"H�`�%�^���$��m��I�& ��,C$��;��YV+s^#Ƿ�y���Fg�z�U��ߔH�A�IӉ�u3g]i&�B�?�ג�1[
����SF3�@��Ʀ�m�6�[�0:O �T��!;Dʛ�>��!E<5�2����k�J��eͷ����z�P�Z�~�,s�c7��-�}a�~�u4�DM����"D
Iw�<o�ց����z��+����xRg�1"QB����p�4NFI���l�S]߼�-kl#��������x8��X�sŊX&ݯ[V�慒����&�<J�`�]P�$��'iM��z[E]ދ3y���s�4�`�l������g�8;{qI+��7S�8��T%v��j�N�Y�m|	�����Qe�s�:�H�&���T�,;�������������� .촯��L
�V�jOǜ�҆�Sw'''���?��ڣ)�f�E�Y�l��I��'to8����r��N����ɿBC��B�i��3�KA���'���ہ�o7׷����Π�rȂ��|?=��֭ӣ?�o�7�/~|�i��ds�����7�6�T�fM%�P�	+RS��������@�E=��D���\�����Q	�YӒ�!�*�����)���W��C!Y�^�����6��`-�޺Ғ�����Nr6r��a��T�$�r-D�Ψ$uTl�����|��H9{m�ض�����HQ���
�Н�M���1�4���L6��[�&�CG�Ţa�L��u�?	�������q?)e�9	�6̇�_��yW@����xt�7i���S'5Z��;�ӧ3���Y�������z?5���ڳa�x�X{���~�Ko}�3��>�I��F]jfI֘�Ѣ�滤�n
�#��	P�O���w�w��Fcb$�$��a��6�c�#�E����0#=��4xf���Ż�`���;����P�S!o\���5�DA0�zz�%����Ɯig�V�ئ��Ij�j񀇼}j����*���`��*wp ɡY��{�Mb�S��ְZ�:�����8�fG������_6�i�e��u�o�5l7-f�b�g
6XFB��"��xC���Γ�.��Q�>.'鏺
�����Z����׻� �B�Z/�iK���:P�^�i�dG��NSe]���R���{L�\�Ɵ�]��8�r������w�v�? 7�ݖ ăiXՌ�.<V�[&��4��!����m��򝦽ZD�U�]x�Zb��Xq�O|{U?ӋD.$�kOw0ڡ������C�{�������Ć�������i��T��u	��ٵ;�}�r�1zE��'��pa[��&Z+{sKGG+�{�T�QZ��X�F\�K�\?lh2p=T��C��Û�Ƿ>����z������y�ٍ��'�o�Dl��zB�W׫G�cKzm�ѿ5+��� ֣�Ք�@=,<�1�g�,C������8�CG~0�X/�i֛��2 wv\�[v翪UQ	o
���<v�'}CL�y�:�+�k����f��e��!�<��/P՞	jr�=�AE�"��BD�Մ�te^�Qoq�[��nx}9�eMҦVUP*�fcu��EY/�'�ZQ�NG\:}�Y�U���jeGsh"<=��/�.mB�7�ˏ�?��'3�J?p@�˪n��	g+�Y�����n��Ӡ�.ƺ�XS��UT08)���C��z�x�
;�#���)P�V�:ſgj&ԋs���C��|����x���~Vц�/�B�/X�0A���<[Я[aB��КV��<BgS<���	�o�a���Ӓ�"N����U�V�
q��Qoo�&���c2��)3дP�j��2)M��~��J\':�2�/8g�i���2��L��>0~΀�3t�d'��l0q鈏l�P�e�Mp���H��E���)G]�:�����U�K�C I��o��!Y��a�@H��_��6*�[��@���=7�gݘ��}*1����<�\��"��,������L��"�5��^[>��-y�.x1gz������"Ou?t'a5�<��5Oe�P��o�K^wmmx�]ܦ�Ŏw��&�8_zOUk檔���:��厓��Z(�ۻ�|��=<i�.�̲"�vg)m,��x���c1#��Ό��iF��� 	hc&�)U:��n��<��-^�4�lP	�itn�	���1�+��#�`�~�ĜX:CU`m4IEE/�V��K��\_^c���~xt�ڽ�����7��n߼�ś[ߜ<���囷8��0�h��������    �xVTFB���^�)f��^E������Wz�k�R��:~B�T5-�M���Wא>y(��Jx�N�kDq��.�2Z|�{t�ڙ�����f��qQ7�6G&��s�?B�R��T ���&���a�i$ʠ�kɩȴ�[/�M4�4�uef2�=(��ݗg�F<�hܲ?A%����E�	r���;wn��jM%gj�8�˳Ͷ[T$q,I��#��oL=�\�<'a�Y$pn6�n��Q���XIL�u�M~V<	=ԭ6�/��x5�Ռ�
J��Z%�Y���ڕ�V�k_�q�_m��8�� w+��&�L�,��u�����wә�1��E�;��B�\x��1�0+ڑ���"��2�t�vݲ} ys�`?O!C��Ix�V>�_�u���oׯ߼�B�q�P��2���c��� T�����u]X�6�ٴ��O\����:���⢹{~<��?[T�F��f���Ϙ]\W3����x���� 5G��7���_�B���C�.�rl���0�� �C.a�Er0��~,v`�T�
��͠�a �*h�w*V�����O���	϶�CY��:�O�޹�Cr��'�<ˁ2�x͏vՒ	G��:�4���!lm��v�f-�s�j�d̓ �Q��Ә��ɇ�:���~�cI����,�����E�>��ID�2_	=\�H+�#��S�Ӿ�{�1�HXG3�Nv�hS��-�������L�ײ�0^�g��ӷ<�/�±Xv�"�ў*5��V�A�b.V���oN\����1�ʻ%fu���<A���L|��	/��0�]w�7���ý�3]<"�\�p���ɗ�ir]���)�:��� L�%xڮe�%�n��]�e��XW��C�������]u��ǫg���wO�9~������͏YSC���,��V縏�'��SDL�t�K�y%t�F�+uȗk0w%s��A�8��h��Q���zmS�V��v	�<$�T��8ڨE���23*G��{��U=���~T���ơz��Ry�-��
^���Z��P(2}��B��;�q?o��2�N������4��ؒ�,9k&KYZ7�#�:�o�d��z���R��b� �\Ȑg���ȺLj]���,�!�#"g��v��2�F�
��R��C{��ѦEs�6 c����]��1~&J���>��1")�F-�(3�ׁD�*���ES<�ӕߧ!K�}Z�SQQ��[5��Dz�@����q���KY�p�"�5;���E��p�Q.�%%DA�0⟲�
X7@;����"k�X>&�}m���g97�+��S9��!�J�)O|��|��-:�`���'/~��ݍqa8��������C}�MŸ���'���~�+���ݕg�V�a�u{e��q��a��$
-��5��������p�F"n{�VGG���~�U��]������`3F��ȭSI	���Y�j�Lk�+� �Bp@��خ-(�ۼ�Z���q+Dz�I�?[z�2jr����鈓�Uq#�X��8�6���S�J�m"�?�KLb�8��0X�,>
�GRH�$?�YtǨK,.�V''b���ˀ�eu��dKW�O�\��C)��K�[:�,+�"`�rUH�������k8DɍN��R��#��k&Ð����^�j�ۘFuSr�5o���>u�μn<��+j��kSl�x[���	�z:�I����ͽ��K:?1�P[����0{�bĞ��'�k���C%_��ED���>�n�=}���ן������;g�n�o��ѻG`�+�v����(�&QZ�6��N��VO��K-m>�tU���[�	��*�A�t��ʞ�ouT!"[/�yDx�)��t|s�&�z�+����m��,��g�?����d������9�A��{��!K�R3�����ƙ�c��b�Ҧ��F;�S�s6�&��3�B���Ά?�Hln�_$V���v@e^���|Y�k���F��[�����j9:xO�����8�vf@�<}��u�GM�:����e�1Z��X�RW+m`n\�aK�\���f�\6u��3�	�n3�=h���<3��W���^�-�2�8�j�5�QRj��tpe��2�h���k!��>V����$�xg����~2�T� r8幢F��ޚ<Ʋ���e������̳%��`��̱#q�Fv҉1�nU��DpT&V2����x%�_\��'�D����^{��m��OnU�;lMk�Mi�
��q�[�E��8B\����[5�������#pt̝}|��	�ͮ�2ֻV���u�A��\i��:O���:[Ӧ�^�,>��h����5�)(;�Us_�H��B��LV%�w6��4��~�5��-{]<'(z�d@�I4��5�/����C�v��GC�ܧ��؄Ec�(S�d�/\�ek�����{
��m�Jf��Ǖ�)?��޴^����R{[����dփvKF\���N5�b����kEM�3b�x��ϙz��%����9n����4M���>���46)M̣#��Q�DB��4b_���v�\.�ʻ�{�ǂE��F�f E�ÏP��e3��i�q��|�]������C�x�~(r[\v>�����Y��'_U��>�-�zp��|���^D �%�I��+��X�˧gF���m)M�9�Hc���Y���)�(ޡ5Ժ'���s_���H�����qn����2��鷙`=`ũ��Kl3���T�v��X'^��/w�H��N���0K�N��A��v��(��:�� +jh���1bV�D�(M���홨����o���9DbnJ �:�l�yT���($�؊�[s����-��|�0����M���F�0$k2�H���};fs�!�y���^�-�i�~��J��0Na��,�0��HŦ���rHb@��*�S�GU�}c������XMW��z`u�:BN��5�$<�[��D�x<o��H�U]���GQҖq����5YA+�����{g� �&���@����8:A��8�)a��~8���/X�n���}..�����o�	$S��6݌W}���+@��=h��^�H�GS�[���d�����cx.bK8�[>���k���6%V����N+�i;	�߆����d
�Í|=�C�_�\J2G����8z8�&��+��=��r��	����I��	�,���4-��x�͠(g������+�C��I�*�4;tAȊg]g���'W���&-�v��o�(��q�%��	�J�pAվ1��L(g˖��xÒ��󌓂P>d\�O#��us6D�r���V�#�ce�-)2] �)�~@h�N��p�n�ݛ�u���W_?�����ǫ��7�V�]�yGC�/�*h��v�/2��;wN��/�j�b˰�3+l��ڙ{�]^+x��)���Ac��l�e�F쁶����|�S�s-�����4��}��1-��mփ�O�AN��N�2N7h"hJ�Q\g�f��6�1sEJ�W%۵�o6�g�'��PL��]tld��/37v� �ۃt��D�>=� ��
d�s�:��@V�%��ė������a�@_�C	G5oy퓾\���^NQ2I>�:�e�wۘʤ��Z���X�3�]�A-6��5n*�����
�(j�D�5�Vm�N-���W�U�����LV�
0A	M�b��Ġ7�[m��9��Q�m���z�����a���
H��;s��p)�8���Ĉ�⚞R�1���Z�<㈋EX�����K��(�Z>��L<��*��<�b���\/��d�Ä8x�-;n;}�vio�;��z�\�@�~�v��� ��#�� �ˠ<���2����_��ok�#�<<r:P�k�f�.���[��X�
P�}�jc��ј8��$�����ڐ�㰓�q4��9}l����R�|��-jx�[K�zE���숹i"=��.�\��J�5��$f���e9��54h V0����6�ά�_Ҡkѐ��$��ӳJN4����`q�h� �����g���w ��@e�1�~��    8+m��v*kUD��^?_���)!�C�t	�őo*�C���)-7���w`���ځCM��4[޴��$���<!7�ѣ�Ր����K6���ٰY0����Uy2��;tv�:��w��0j:����.ԍ��Xwp���BZk(3M�i��
��(}���<8�,̳W�}�w����p�Ns+|����������/�߿���7?5���,�ʬ��}6!j�5��N���g�Om���ʈ��ܕ���V\��x�C�)���4�Ǩg��%��7i#����FM��L �02�P(�逎B�K���Hr�,�渂층�v&)m�m��DbQ��H�������e��H�ɔmƥ� f�\���{4w^�SwXH�:���Z��#^�ior��c�T� bH�Tmaɶs�IW_U�;�:�%��b:�M�6Bc9 ���9�ͧ����n���Qz0%l#�����lZ8]�����D��A[W�J�I59�L�y�}]��y��������m|2�#1�˜^��P��דBk原ax����5����/�ƕ�@��~���v�,47������{s�#$j!�Ј嬪�T�96p�b��r䅟�\-���-F.��Ɵ��v��Ҏ�۲�8�6�V�<V:�*�X���좉���ms��mSJI�3/�)V�TS�8�E]�����Z*�)�{>�kܯ�n䴧���#&[Đ�0{�W� ��Ƴ*� y!��1����!e��J�*���dXN��l#b��C6F̢�v�)�!ev��Z']��g4�]#T�����?NC�g��x��n�uY{�f�W7l7'vq�������;^v芬-��v�Q�OB��`b����I">��r\�M���>3W,S2��EA���5W�v©?��[*5� ��+4n��IU�x�lj�$[�i�ݖ|�����e����?�����G����ۛO�?��wlۯ/ߺ����[m���dE~�&�{�h�v<�(��}[*�TE_� ^HՏ��a��0�P�=�pvF��΅�K�t�Oɉ)3�&qD�ӻ�����%8Y	ɊyժI4�rT��v�����L֭���
䁳O��>⣏��k�W��}�l,*gK��]&��w�wu5��f���[Ub$����$erB�;U��T��)!�#�:J��I���~�wckl�:=�Ce�3��&�?�Ɖ��d������5=ң|c�·�>�7q&���\�(��] ��{yF1SH���~��&�]�g�5"�G
���,�
� ]^��06z��O�d𓓩�'�ò\U��[I�Y�H�L����ӊ��"`�0%l��d��K4��̅��e`ܯ[��0:�O�����I�3f�eo�r6#���FK�Ǧ,g���7�r	$�5U{�T�}x�0b���������rc5f��M�|*S�&���)�&{-�e~ %�Yu�Lf�m� +K���	�TŴ���"��������8���z����5˥Ս��V�']z�)bc2�8�0tx��s�`��LY�{f��Ju�ؐ��R�j�Fm� ��%�-����sA!T��$a}��*�ӭͫ�[��<�
��6�Ɍ�M��<��6�o�y��T����p�y�-d��P�N�ֶ쬩ФfI�\&V�z��)��k)�[�<c�u6�c{�A�e�p��|.H6L+)+;�R�9����5_5r�uE_7k�i4�+v��q�G�\i3%@��F�M\�1����A�%o���U���4(٨Eu�^
E�*;DcϕVg���]m���Q�R���!\b���xam����L��dYdF��d���*�S��dZf�$�y����Ι�b�][eY�x��y����_;i/Vw��5''�/�.ߺ~���KGZ��4�s��� +��K���"�W�f��ӿ88�hT\63Hׁ�%���í���6�|���]��텓�l���ZS���|�78��D�}����l't�9Q�r=���#q��D\	�x�b���ٰAJ-�y��[��z�r��Pw4[����6�j�:���A%��*�����i޾?N���]ġݤ�G
�|n��ccT6g��7~�l�`ym����^řC�\���=����B�F�jY��?����Y�wU��vase`����;+��+�8�~謩������sM���}�|ܨ�Zc�	W:d8�N���7u���6�Q����`���|����+��Q:�� T��+�)p/k��q�h�b�ڛX�Cv,��h�X�(�5׸RP�&���b"��_6Ռ�=�pu��In�F�eG��=]8�0�@`~L0�x;41�Y�\�F�U�3�3�s����^�����- ��H�NnEW�e�NI����n�
\x陘����
6C�UB�὎���j�b���B6ݼʛ��F�Xhz���Xq�F/�+���8��m���.�G��8N:�F^hJfF�`���H`S���	zN}'N��1��y����眠�&�CR
g���S*��I|V���eRf%oK�9�*��K!��y��W��y;���wy�N��C�Sy���{�ã�9Z���`���^'�}~��8`����O�H���C~v����3M����o��ġ�C���!Dʰ�8.|��lNe��	����Q�4
j����]�z��Tk
�Ya+qg��0���'�&���F�������K߿3uCJ�Ɖ������l�I�؋4�"T�ȿ�ITk�eI��d&�q����/�fq���ێ|�������7��?�/�����v6إY��)oV��J�SY�8S6����L�4�5��ڮ8�kXo�� �dJ6�|2Z�8S@;�q��8m2�����*�>idA�0�����e�'�|�������T��������P.�^��8=�8^��F-J�E����څM#�y|���V���>�H~b�F�p'oc	GòW�1�ƣe`?�G�{���>�!@6���1+�6�:�,�c��)�Q�<���7 C+.M@W��8D�-�,�i�d���u�1p?_Y��8L|��Y�Űd�"��2��k4��45~ /?uJCv���;MJ���p���N�?��t��v�YJXSF�Ã��Ʋ�N�۪LL?�i�b6Fz����!2M�m0Q��;��6�L�N��)�x�ҟNlD�/c�f��V�N�oB?�D�`�`��ԉl��3��0p����k���J>�Jv�dX����nq�P�R�3\mA؛l�M��j5A�X�[))Ei��8T)��E�\$X�}u�YV��SNG�Y�wǍ��I_uu�R|ѫ2���4Χ�)ěO����1�?�b��#���l\?�F�@fAj�`hP�j��{C�ᛟ�^>��ڃO�߹��~㇛�'���˷n"�|5'�˪!}f!�K�]+^z��ˑ��9���_����f�ұ���a���`%�w�챃����@8N��(n�Lykæ�m� ��^�h����dk0k��O4�ؘ�Ŋ����6�Q	���$JW�Meo���T��-�����ѯq�0o�z���Y�O#�=k,�!v�A5��E>c��hu�c�f@P�,�1)ޣӾ�^]Y�	wx����h���ʫ���+��z��\�nh��v��_&U�Aw������b�bY
�\SAљڹiW��`6�w�b�qT���z�ɨ���U<WJ����~Ĉ��$i���o�)6�XUh�������
V�W9?������*h؆<d�M������Z�E�b"�e.םF[@9U���7�2��C��$�V9G%�͊N"ȱ$��"��65�gJh���d=��T �6��g���PĬR9@(Y�z�;��K����i��<c�r(X�O��ll7)M�2p�C�@j86���.�q�M%��M�(����t���Pf<��e�׶���+�a(��R���%��Sh�ׯb�)����J�tFF�-3��F��d�Ts����^nk���NS�ݬ��D���)&�0�xS��ߟ�NL����1st�S���5��V�JC[�g�� ��    �N^���~�l���{.���i���R�%��i ���r��Bx4���钘���y&<w�A�2E�� �g1�SM.K�<�ǰ�%��hv� �g׊�*Pi�ap�A�#�Ļp y�ӱW�$����x&R,i�T R�K�#�m�`?	����gOg#��T�2 �\��.m�F�%�U���y���
z�~�����w�{�IxԼ�����;�G�������˷n��*� �*���37��xG�,hڧ�d����Q�ݜ6��Z
'���A# m�b��!�����Y�B���f�@Q����D��e��J�Ћ&��T�v�@֝����Z��h�J�Zʎ"�,�s�Dmp#'k̹�^j���Z��3b4�	q#Nm#���lΡo ���7r����ƥ�ĔԾo����Zb�f�i8�T�:�8K�Er�f�=e�F����!���h���S�9f�him�Ѫ�����	<�'�3W:���v�)�g�?�X�A�h�C§@����P�{�S�C��N!,��z-��;�2!%-OǏ�^��& �;e�7��&�.b��P�q�p���k�5b�9�,��f�Bb�=�NP�s��ኼ��!�:d7��'�<�J��s��z� K5���K��o��I$�`	l��Ǡg�nR���"Ӗ�/v�v�����\��uۅ�v���;ީ��iB������H��^޳��x���%-WP5�ae�������.�EC�c��E�������o�9��7N����X��ت�ޭ���ʎ4D�]��*X��Oax�4�T��l�-|ةoP�cؖ�6�ߵ}ɎW���
�6]	xg���$��L��sw����\W���]��\4��V�U�w�'�%��9�����y�T�
��n��;��Y|v�n�yd_p�3^��Y��_%mO��E8���2 |��MJ�.��  �F��[�l�#V*U+kK��]���O��g����̢K��	��/�<�A��{Q��{��ƻՃk��~x�~p���ݭ�?<�|�&V��8V������-y�R͢��H���wȉ�@��g��}�S�3iQF7& ���K���"��Xe?$�B>>0[�0�Sv�Oq�3)�G��z&�:�W�,��/sVǚ�(v� �hDϤ@��霮+�WR��T_v,ʥy?ky(:�ȑ?�N>W1�
~��#/z��r~qu����ˍ�����Z|�.��Xv,[����vM�9�K�7ˉ���\D��Z+D�0?��R���a��G���%m@i'֥�D�֣Z'�r��h��|�i�dr��"�S�68Iz˲�a�,�6!t���J�&|��5;�Ml��O$0A����Xge��ձ��oz��jk6l��ϓ����eI\S�~!iB�[܀4ޘ&eB�}���z��pI�C�L����("�����xb���U�)���fr�x���v���>��Y�f#r�t�
�8�\�i�jc:�W	])y��α"�^�f B����#�����Р0�H򷮣�n-�]�|ר�����b��I�/o��-��3��#��x
-_mP���$�DQN�L�*�v>+>:�3o`��;���;���ŧ�J����F�9,1AŎ�^�\�.Hʀڄ��#� �ז CQ�EIUh�ɨ�bR�	���Ù��:�7�?�]hf��7F�0��E�3�1���EQ�]Q���:��w 76�Axe�@����Bz��A�|��OO��~�~3�����������������[�����ky3�-.��ݟ?��O��^)�d���b��� k�F�F[�p��JR|�A�-��#@�)�������!.��&���H>^��]��T|�����!�֜*�I.iO�TT�Z�U���'~�0J���9Ӻ�C��J�g	�R`�Go���~��(�	`�t`4�'�EBI{����il�����.�{.X�5ofe}[�mZ�Q���fO�m����wS��@�d��Fc娭�R�Zb�{z���Y;�
�9"����e��3_שPP���td��	����/��t���ۏ�{jjg4���/_X�y���j)�b�D�S����[y$�m�:U�����s���Z#u�zG�-0VL���yڳPɮn����:�`�d�g�j	�k�V&f�}��|y�����J�n��9<K7)�S$��#tb&�(f�e��6�Z���5�@U�QI��8U��ca�� �,k�V�?����ǒf6%�G�h�����N�X����,Vh�n�`A�J�v�
�^��`k��R�N�꒖���&��~VGW�b�f�5�ZJ�8�y6���^n���Jug0��[Q�{�[^�@���{�#2k��L�d���VD_c�"a	'	%R5*t_�ɤw �CC� 0��+�.U�gZ�K.fp�w(OM��eၝ�Ӌv�tG���Y��?�ZQ0�kO����Dz��y��ƺ��?�IuT����k!�٢�a�� :t5�pJ_bs��n�Nඨ:���!g3{���;�O���'����v�;/�j����7nK��ڦYv����r�ሚm��b%L>bQ�^��=�q,Pݿ�%�$�G�<�C�q�k32���M#3��怨�þ����c�h4#Q��t����V�a�0t\Ów�����ˎ�~ ��H"KT��v�%�H�����������aԢ�,~ji�[�x��fX6���s��I���}5eK��/5���:��X
�>����'�zxj���ҟ���1JId�B.�zS��3��"BcdOr���_-٧�H�+��FOJ�۩d�i�B����Z�"�O�;�ܶ��l&�Ţ�K\�:���u�Ȩ���� ��W�Z�[��E�`x�/�JyB��/j�;�&̣<��ruK���E9���W���a}�al�z>B ����T^�|���B��@G@t�/�BoY*��I�����8B���X}�GIF��&0�mqQg�)k/�����a�\=1q)�Wcx-ʙ -������q���<O�_z�x�s���{N
�:�F��=*�03b3�L�c�aMǶ���K}����'�c�R��x�.��47�K��B<���������}q��7�O>ݽV�xu�իo�o.߸�\�q�4ߋ�%�x$�FFoҾ� ,�8Pr��V4�gbь�9C6�*�D� �S�яa�N���i��ڔ�[u�F�_�	`_��!�R�q�<>ؖ�㼓X'����)zn8�'Y'��x�e]kӨ����p&Xa��ĩ��34�k�*�w���V��0���<V�b>8��ȩ]5�:����2#\������G�5��CL6ʶ4��V�8f���'7u	�J|�<��g`�ʾ��BݘB���c�n�����o���(���� +��g��a�bm2U�NԌ>H��~��"j��A�o[��)�-��Nyc�J$]�9�B�I��T�S&U6�Ƿ�M4g������$�m-���s�<�I������5o�%[�Q�3o��z?��mx���۵+W'��l8=�KPY��p!�v���=�Ʌ�V�Hv{�#�d�(��ׂ��1���鿯']8�J���$*�����B�E�Ż6ҧ8�ڭ����ci@�n�S9#Kt34�� "R����S�n�RXsue�e^��H.�z)� �dhV5�q���6���
�����љ	��T:>q��&J����v'�/�b����4C]�M6��:��3��_k�(�#C�Y�P۱{n���GޫG|�и'А��nJ��+�'�b�V.1��=+P<I
ET�y)��K�Fa�'W <��<�_�F0Q(zi�]�鴺���nv��O/���`���۟.߸+��c����e'_yb~��������N��7eG�)�M�Mo$�}���P[l���R�lϤͶWh�B���KbhuNIs�1`Ab,SȾ�l�y���J��R�"l�+�M�)���@E��h�Qh�6Le�/n����0n7�̮k�`�:�y�g:��-j&%Q.��d҄�RYyo���]�o�TI��!�A��`�j;iP��3�(���l����5xf    Di�ѧp7q^������.'���8%��P�"CP[
#��C�BqL�,Z
�+�S�q-�iYSf֑q�+߻���rt1|�a-�Rpg�������g#��op0tlkh� �0T��仠pCe��w�D|��v��S��1���`T��7�	#�,�ל�x94u���{)j�}J �{�P�����̈́�:.`%1���I��v0K��$>AG� Sjh���PX0�T��!�Z�7aA��Y&Κuk�*��:,���.DZz��{B�ߜ��ؗf����E
$�wt�Lބh{�3�g����aE�״�u�&v�d+��[Bh���vSH�A�6YN"�6�K��d!��m8'�������)��<��XOu0UCi�'�oK�l��B�+L�?��?�o�d�-�����!px�q�2���5����/r��T~��
.c�Ԟ�w6f���2�9a���/H�G��k�#/��q	�1��5}���O�B>�5�(4��
X���T���h+M3L�����ׂD��V��vXl�#� պ1�zt�YN̗9�<0�l}5lí�c�KNO.�J詩��+m����2��I�wd�3�tz�Q}��x?����<���sȱ^��2ѹ��!�Z�v�C}�m.`���٥�1�h�l	�S�#�o���x;�����ov���^���g�{ܹ|�ʹ���@��)��y�*�@��+�������jjޱW4-�e���@5;W�f�f�]��gS(��]��sk2bsCԋ����f�E��$��\���H_�<1�<��<2J�&�2�z�h��P�Ur�6�8�׋�9��\4�N����u�3jS^�$`�E��kOzqq屦�`ݎ�Z����8��~�+DcT�gE���:�7,�/)��/R�b�I]5�	kZ���V9%)epn�ā8�:H���$�􄢉���ϩ����/�E�p��*.R����>�ƘT! u�K�k�2i%F�>%��>BL����{���Y^4��Z�ܞH�Q�"�DiORč�(yt��b|@ĸ��x#��!O�H�{&���r���u�/�>�6�8Տ����� �1�I�l�X䅯}$c�s�4",�(�E ����z�Fu�5R����p����7�y�R]�]Ԃ�Hڂ>���E&Q�[�g:�;�N
i,0M{�|���E9\D,��{^��a_}_G��X�WG%��lF�}�l�VJr`��J��
[�\قwQN^GbTÊs�d�yR�]�I\m�'�iyTۉ���׻.�ŧ�H�N�q��K��g6	-�	�e<���f�|�M�+x*�C���;���h�m4�J�1V��)HT϶f饇�*�d�� ��K�oq<�M{8y���\�����:ƀatTk�[�T�`ӻ}ϓ��QA2GP���G���Ȉ:����%ԑ����T];�C8�i�\J6�U��p"�Z�6: ��j)��:���")��)9������1Ec�Ӟ,��r��Z����4U= @���®zg��)����#R� �b���oI2��d���\j�q�*Jd�ゔ�e��`1�s �C/�.�hrTQ{d2�+"gU�	���`l.�+��j��a��f�"t�ۡ��1;�Q�/ܜ(X�c��]e6NF4#�oޘB��CM�_㠮�.R���Y�A���v��[?!� >yy�ڃ���^.~�n_�^>yp�շ?��\u���nݽ��b�A�
�T��^����p}U+	�!!rۯ*W��W�V���r����F�M�k�����!흇�]S6�N22Y������A�Ȱ�l��G�E�ʯlW���N��J=�|�.z���h��^y:Q�ɹ���r^Ii��I��G�P�,� ��~i)�ϼ�x +wEF�0V����0���o����1���,�C:���bP�v�0���'v�H��� ?RJ�u�[���β�)�<��s�9����<+�ϒЪVTv7\�Q��M��u�ʐ���]�L�B��*���!c6���I?�u�?��٭�ɷ_�8�"rtdG^K<S�<�n�ʫ6������v����e�� %	�������'��֣�`����r�ermޓe�]Ǻ���k��e�Dq4	P)��DZr)aCFKbP/ڶC��2��Ͳ��+7������{]�u9��Z͠��U���hko ��U��AbiX&�!����}�*m8�� >����p;�;�(a��~��y�'�&[�a�������("A�8�mbWi\�7Nm��Ko����B�5�UH�v�J����b�;�K�g�e×�~��|:%��Gwˋ�T�x�b�η���RD�Spחԅ�VZ�k��x�I�8�u� a1<���=^�#W�@�-	���t��b����}N��ɰ���=��̚>>J�0���hYiM�8B��q�{�^���`����b�J�S�[W��^���|�0�y@l������+D'�����?������O~��l�������|�D'������%��5<�k���5�O�wt&F���40�IXu;r���n��_���F��ҢNo��#�i~<�|P]7V��(x�Ց��7��,.H�I�Eu#��N�ܕߢ���ei)���F��P`�\��p�l��Z��M�l�K�Ɔ��C�S�ig6�2�)��g���A�\���I�*!��Nn�Q�
�ۘ��'�^���9�\����g�� B��,Z'�h��0������Ҽa�SnjDhE�m�E^�f���,������mc��@�4ժ���yKpp(��;iI�]�q�����oI�/�8�1R�sS��X�\��$��}�m�y"}&=K� ��1��V����U�֮���Q��|2��GR;�6���I����y��[���t��i	����#�7�����D��N��@CC��æWſW��t�X2VՖ�����K�M�2RK6��<� �����5�Au���JԖR�U�z������(anM\���!YQM	[�Ѭ0����fjXN�I����B��3��N���U�c˧5{����F���|u�זm�Sbl��sa0X#���W�Pa�9�J�8J`mq��s��Aqk |;��D�ڝ�
�332�I'a%X�0x�[JAy�L�$Xu�~`:�ܢ�ܶ�v�Z�3ǽ�������vz���
��8wP�]�g�#���"O��a�B$g�2��vckv&$' ��Vy�����ڷ��3jP����a�<�'�<�ʫ<T)p�����Jg"�p�8��
�"�T4�����¿c<a�'�yQ8W.�n=z���Ow�k�ߟ�������C������&X�/�i�����U@�����5�C�-+3Ej���&bx��};L4sX�X ς?��ݯ��S�g�`��gE� Ac���$� ��D�����j,��j�m�AU'\A/���vgC&|\�\ϊfN�n$sr���n�
Y�6[�4���?�ׁ���Zg'�Q�A�{օJ�~q��/J�+���S9�v͇N¦�m�hS�z__���'�ܸ_���9�b*m�t/R�U�<.�xT�U}��ͥ��!�ѓ%�".CE�S!FQBrU-ix.=� ���M�PJ�җ���;R�
v@�����E�hPnv����kj9L��k��?~�NVA!�H�C�m��#:�O'�7K����8�9��Ñ��1[	a�C�O�C<'*y�1�;��cb�(�����!����1��[$>�\�o"�b��R�1HK�õ��U�@&�!���ɷ��!��x�9�~9��s�,h��G�a���YXF�ke�>zyH��ڊ�'��ks�Ǒmdz�����K\;d�T�4Z�w�#�Lu�%��Si@;�{�WKܧ�$h��S�6R�r1���{͝�P��z�FM+d�1b��"��n,,�߱K��`$<�΢b�)1���<=d�3�������չ	�ת�P��%� .S����.��źj�"�4q��rq�E��.��V�{e)rTBTܥ����Aх+O\�����t�tT���B��:��x����ݣ�����?l�o\q��Q�����ӟ�    �|�jM��A����-+�+}��v��Ě�K����b����*��L�|[��d$��o82�yi�Àj�u$9��"�p/ͤ��ԧ���J���礇�#�{�=��[[Aw7,�)1�5f�.B�p�0��62ub�G=P�)#������*�Ȥ���0W�Ҵ��\Va��^�#C��'&k6��F{Wn*OU���� ����Z�u?�Ų(v]�<Iҥ������9�������d��m0���j��/j}���dR����췊���`�ddF���(���::�LBI:G�m��a(N	B_���p���dC����g�`ʹR�wR�:?��59J���@g}Oa�+ J�VRP�8i'^��!�꣪e��2N�D�r|0�՜k�tV��.��&jj�e�ǭp����)���及Y��0֚}�F.>�J���瓃Z��b�$�)�[-,�lE�ii���tų��0�V�ZoŒ{�m�����E�X�6a���r�T35h4�&�Tij�4`#`����z�?̋"��i�.zИͪm��<$�^	)�
��S���a�U����b�\����	��� ����/h��jJ�'�xj�h -��7k�f�i$�8 S����6����uV��oF�k)�.�]�-G�������ԏO��~.g�����bP]�A-'@�¨�I�V$��P�����uy���l�����Q��=�������@�ۋb���:�=;9����'�?|w�铻������7oJl�)�����Z�=��9τv����DAM�����2�r�/F�ƥʤC�ѧ��'�˪�gK�'�i|���Yfi<��\w֏A0Ǩ�/��eav;<�Vݕ\sg?ѬΊn�Q)[!S��p�m�y���ˤ��O��/5�����;�2Ӯ:2�}�hd���P�[h�0][Uf��y! =w�V�F-ۧP��=�90QA�	vPO��	ý��x݅c��
�}`ӌt�F�����q�[\�#�76+ی11��D��D��J��e
=��~6a�g>����r~W�\�Il����Wnt�����;6;�^F-F���I���u��
��JȾV�׃���"V���d���V�x��[��;�N��#����)z{k����0�-t�%�*�hT�Q ��
����O���Y��@�ƕ�<g
�H�w�2�>9�j9m$�x�Q˵d�F���OQg{��R����8`NVu�3޸H#j��}��@�+�+��;����y�uٌ�A	c���y�C�@��T����D3���{g�a,$臇��4���6
�q�=���IR���XK�HА��2��9/-��ة!+M���!���ٌ^��/S����Nb�n}����������������7��{��{�o�V�77�^�y��VP����i����z�L:A��lZgZ����*�%N��姉%r�$�M8
(�:ǭ���Xu	�R�~!H?d[lc3DҶ^�+��	grkwLHiCz���;h��k����y'�U$��L�o��o���U�o��R����;�J-V�m������JN�"�������j�I����\�`(���Ǭh��J��8��@�T���'疞@g��	>��8W�S�)f��ΟL-
&Y=�~7�p6:�X�X�Q�..$���������	�H�9��婣��F'�ƫ_x��[��/�K�쐰j�Q1�x�n�ֆX�ys[b_����������F��3�z��j��Tp榛"O�G�Toj��E�#���p���7��0����N*�+�G���6���ъ>�����(����T��	+2I�Z�us��s.9/��KnAuT����o!2r��<�$\�0�o�OE��z%�R���������Җn��U�S_7EO@UOgd��n���e�T������p+�u�dCX��<^x���i��*�!'MM��0QL�ơ`S�s@x!�ɸ,$�_�q��3Bb0�!�.(_8w�[��8\֬�(fp�f�n��ⴂjR� ��s9�Y�)z��`$I֘��4���"1U�rDT&j�2�n9)m7k�?�'�׺Y�2��L%�s�ư|�K��b����+�s�p�����'�����I�H���S6�v/�io�f7��U>�_��k�����S�)eukb�lM�Kf��_G�9�&��ɲm���s��t�9h���W��J?qT����3 yG��#i'����|�}�E����M}Z~�ō���'�a����/��]�y["Lل"8#ːR���~�-mj���4����2ɿ��Y�4�����U*��WM�W�m�iJ��0	6�����EW���!�X��.uX��Zj�v>W5�3�(z�C�8��_*ɛ��R�i�Җ�T�����o����i�:2ặS�U�7�7%�G���H���� YL{H	j����i�
Wq�X��|4� v�e<je�[��i �m{��Cހ�Iݳn�(�����ֆ�!;����OW���!�[���ת�Wt{)��]a���a��(��I�Z9�:Gx/�.@�B��):u�S8��q/3���QΟ_E`љ!�h�\|��R�G�#�EtF�"�G7M���y����'K�중L���)d�DEn�g�r��Y&5�Y����V����	ŗn�[wb��{t�*�'�%P�[���{�x�K��M�,�p��wܰ�c祉G`�/J/���p�aE]�J�Q�M��Ґ��fZ�MF���B$���=^#_�k7��NѢ{��efb=���Xx3�^+�I���MB�<|g߈K� X�"�W.���Ժ��EK��%X���^p��W��)>ݫ��}���<YU?�(g�w�^�y���76���TkD���a������G���@����}�f�RR���|�#755�4$�")��SDD�O1��V+�]mr�I�{�D����'In��߃�0�qQY
ιkJ��9��u���4����c3�)$������>�~���z�9v{	���*���!ɎH�<\�x2�`�u3-5F|�B����~�	�aԀ�N�b��uX�����ap3���L�GPQ=��A�ga�_@g�����MI��8}�~�<9�|XVB����lC�HS�煹�#(��@1�:q��_Y�A�*?&�H��|�m�"\lk"��L"���jm��
@u�	�{�S��燓{��QX#����=�F)DK!�����m8oT��)Eh��0�0�����SH�%��&��ߥ�W�D��/���B���o��.�!��_E���ի��wۈ��E%��$�*z#�,��
�@ʁ�n���r՘Z�A﹧h紟͞g��cm[9C�*B:�6Hf/����Z�?R3�y&kvl.�p����Zt,����!, ����>�\�"�Y����șl�:�|J8��Q�4�	1�]'�t������<X�[[��$�N�3�1���.�%��;�o�@.T��Z`�
�	���ڢ{_d���|�C��q�]nM�����+˵�	+�i�+R��}��K�`!�!�[�%�I7�\���?I���1}��ܗ�/���峍���I���A,~�B��=�+�OVV�"{���#���B6�0�"�)���} Ww-7w*qP�ib�/
�^�{���mv��/f_�y�͵�ѣ����7�*��� ��?�GK"7q޲�VF�P��h�QL���>��Wr���6
���$��-ʓ5�2kaDhq�Q����5�2�
ٓ����Cy��VcI3+�Xݳ/��F�u��>��g0��v[�@e�l͡i�_�|cܿ ��M=���a���I���VU���f�����Á�| ���֓M �A!&�z<5��f5��F��eSx�<fvЉ�ͣ9qM�,˴���Y�'sZv�=/�2�\9i#�����&��6/�niI���j�}��ā���j�q�=(��YV�����Y�uܴ$�Y�B` 6�$,5<�N�7�������Ҫ�*"@���ˎ۠GSwJ�l�(N`1yڙ�    �GT����B���
�KUv+�I�fl�؇Di��prRV�Μ�v�WH�̳*�0��عŰ����{o���m�
�úP��"��8=���%e��5΋q+ ζX��H��.u��aE#����:�4�3�ޯ��w>
�%�,���#��/�=�K�a��0�7&a��y�6?X)�R���c�]t��n>[��~����w���;?}zw������|�*U���^_k�</F�6/�]��.��<��o�~���ޫ�$�u��.����}Q�L�G���j�K2�Uȼ;k�� �&"|i�,7��*I�+4���j��
�N\������*�2��֫�_��jS�.1�~i�O��#����Q��BM�b�y>���4�M�5�Fi��K�f#����[>���[�#��bu�ju���W]�M5�����Ϳ}>�{����<�]z��'�����Ꭓ�¹�I�0���IdYnem���I�-���k��Z�.h�JQ���V��E��d����!LT9���Wr��]9�BPK��8�u)�e#E���/���;� "�G��5�J�oBn	��X[d�w��0^��kB���ݏFkr����D^@��2}�����)8�M&�N�G���0�ѻp9�����Z��;������9���a	TD1��vuU�l�&P~���k��_Z�YYxp~������!7d|�w����^���W����;h<�W1�d]��>*U�|�cb2�R�0�dę��a\X�^8�d���,
�>���e1 }"���/G������T�]�l��-�<�E��߶��6(��T]M��jc����5~Y`*���a�n�1P�֬�f��{� �#B+E�eZH�p�A[��jL'��JzT��+^�-8K�.(��ՠ9��9�֝"�h;���j�~��;�mש�k���*[&�Bm�S�\�Ig��k\"�X�c�e)T�7��Y���u�KE_A!��mO�*�cy���'�zԹ>�#������XNfd�RU�2��F���o���̘����(�x�tqz|u���[��5��������aW�y}��/.ݾzI�~���hˋ6B7�i�y�<���� AR�p/�5��9&Q��6�p}�ZVʬ#�b1��)�
�Ε|X;�G��|������\����%m;�5�	�-��g�Q�YYH����$ ��+�Lˤ �ل�n�.�z��QO(8�J�F��xԆs�p���'��Aù �n��M���@FN����HҖ���E� G���q��%�ܠ�{�.>�J�᠑<Y�<��
���'�0]�<9�;"o�Ҽ��S9��>�FD�y@��0ьy*QC��F��Yb�$���c�����:�;Y��ފjG9.� ��09.���{�P�LLAL���ux����R�]� [G�=�Nk������E�*���g�l�\�W��M?᪪�K�b�8n�7��g��֩�*�����"�D	/onȓ�P��(�uU�,�����]�� ��b'<�B��HV��-Z�mֲ	��i%��1��52��}�eފ^fȂ����1��Tzl1�Q�	��%�,���<)���(�فwT�j�~�C��j:y&h��:��ۅ�'IA=�Pݪf�n�潔~�(��I�����K�|\V�RЪ�e��h�+�`H0O��2��:F�$}�Ȳs)aT\���M��*�?�&��Epl1=�'OM#@�RR۴�]I������OQYnG��!_K�SmE��ډ}�J��X�e�Sj���('���Sy��������Q��lf/T��;r@�Ijќj���@`����-4Ej�^Hy{�A*�ͬ�^Lß_���s�X��2$�g%>�x �u�V��"jC�����Ƚ\D.���p�\��` CJ�Xbܖ�0E�z���}�A�M
}WԳ�E�{���H80�q��>��*I�ǚ~�Q��=��@� ��p���'��?��yg�[<-^/V�~Z�}{���[�$�;D}]"���E~ɹz�;O��k�ڒ�]�Z{K��B�i^d�p�
��K�H;3Q�Q
n�ă�L�٢�IE::Bm�?ױ�%��E��u⯽��t����ⸯT�	����ć�9���G�;\�M��$g�3YH�ao������<a�/�@t�ݼ;����pyu�� r���1ѪG?�-*hց�ʒ<Mu"?*%1�v�C̍�
t� @��a��3A�M2p�� |AK�o�@(�Ңi]2���J9���'
߫�!��fj�r;�a�K��l���T�j����ă�]���j!����B6K�%k�[��AL �8V��N�eSJ�!S�X�z�)����_O�}���7��m��a�$�ADC�D�K-O�3J��2�b" ���D��#��ɛ�مC�zZ5Z��U���v�_A�Q)��T3�N8�6Hg�NOܨI���8��� �脱�iwک%�p%���d��!�a�s!v[�M�֫Ӌ��"�ٯ�釪���*�W�����#�J��q"�+7��nt�B
���M4�g�j��8��	��B��e�B�Y8���Nٖ�N���6�t��Gm����[_Y���a>��'t4�h������I~���K<X�1H�z�O�{����=
�%¸�
������޳���/�B�Mu���_^�u]�0Dߊ���U�]+G�� E����E��V�G���\a�a��>~v�;�ր?/��G&�&n��rK���*^� ���E�� c!�D��3������=Կ���Nwi\���-�ѲB��~�_�0Q7^����
��U�u�w=�f�� ����ݢ�?�DI�Af5t=~� ����Ш�LS�t6Z<�>X;۫��DݦRW}��~���;bW�wS՜�2e�$E����,Ŷ.����g�H�tV��n�1a�|s)�@Q��*ܶ�K2Ma��XKc%�E%9㑻Ă��l��Y2)9��Ҷ��N({��|;�&�����J�$GM���7��):�J\g��-�H��|�Ǆ�Kz�-m
�?�K������A��N��Ұ94���������]���3�[����>bۨ�3@�!�ؐ�[S�c��H�ڷD���5�2w
�H(:�k�� ��e'�+���N �ę���!޲=�4sb-.j7L�F l
�w��k�%x8��ԇa�g�	�\.b�>Y��a���:C~��kg��ֺh�L1E�UÙ|�Ot�N�.N��-L��̒�t�Z} =���s �U-7�3�8q�̔�jCQm)��]b?�Ë�b���q	�+X�1��T�c֬��0�}'O��4X�'�B߿K����s]I�ac�ȊmM3�\D�C$ ��(:GE��)�՘ȏ�z"7}q�8�.9s��*�Q�k��䩜�"p�e��R��e��f.u�bDE�2� ����,ῤ�-wz"A�F��@��R���}ȃ���E����xw����?�{����W/?|�f�<��7$.z1yT�s1�6�-�6cb���oJ	$] �(�-�z��o�?���>]�Be�L�[�hh�;��j���Dt�k-�+�$�]�r�
�q$s	¬����������|�V�,�9ڎ���;���f
lĨR�"��A<��5��#�n��Q%9���2`Xņ����S�Ou�:�m���<� ;\	Zc@"t��(|Ş�@�D)BTƶ2��f �j�3	)H�����m�:��@�q��T�
��<T����.�`��K5���7�"��N�db�s�N)Ǘ3��W)�U)���N�|�o��++f���R�������e6XVk�i`�'c�yU�_i�8��nTKG�M�H�nB�9�cXj��O�B���By	�Uuy�5���r��� ���:��"�!��Z�(�$�}�¹�N��9��˔#�K����[�T�C=��l�\m�(�ٕ�Se���C��CM��X R�ҵ�:\=�O�����"�.�/�Fɶ���S�L�5�,m��H�s�H�@m�VL��$�0�ߴ��-�9�W���+��N�j6��A�Vo�|W�    ���u�Z�{�6E�\~/��"��.�ಧH���y�.!�d�N�^M�?4�(�ONK���뢀BY�P�1��=�=RmXd��Ki��Aqˮ��LP�[�U=cK72ԆמT��PO�1��)�Nz��L�i�0���f�3���O��6�s�I��ƁSn�L���A��eΝ���]��.��6�i(�.܉/�>[�����h���b/��P*������.۸\�������o����Nn|�z�����ʟ�>�|��m���љ<�B6\���N޲�\Y�f���'���[��>::�: �Zuk?��b�V�9;�wt��	%9@@Q�$��*�w�4^m�.?Q��?֙�X[�ځ�l�P��ڶ�$Ջym�M]�:$���I����h��ٞ�:�`�)7"�(DPm0�f��,4�,,{To���Zf[P�~��9Epf&12Y�GH�7GݚB�Z�SM��a���A���hL�p2���R$q�/z��� �p���b�*��BQ�wR�, �"��2������#�)E��J��Nў���@��QbS��V�D��>V��@8B��p�+X�?Ŗ�\ �_���WS�kj�dܺ�F-W-�Y=/'��*�F��eE�v{U{6��6'Ts�rr=��&��r�6��na�)� �v���u^�R)��q�d��[��k*+�E&e�[@�UA1IY;Rf��J�@�X۶�:�9E'XfM�L�O���w���U�k⺓������~�:����ͧ�|S�1\Ch�-�*��)��+��I1�$@������J�aQ
&��F�^.`�o%Kۆ�%��	�-�'���'��J>-�����mˍ��(>u�J/�y���5��n��R����B����*�`ݕ	~��M��.���fŦ���H8��u�=�PԆ ��q�T���� ��K-=ɔR�I�o��������o|ұ�*��ˢ�q��u��Y`�*�W�$7 �re����/�?��!�c�0�.�O�(��,�40�@W<�xR�^��E�]*=��<y"�������.���[լ�~�}^o?>_v����������[�$�z`�gRr�n G��l�厽
c�۵�VFX]��ɍ~%��o`���RM+��q�5C\�g����6�&$�bL�P�m]�t���Ԛ� ���yR��򦭤("����ҧ��N
��*��J�C�Hz�Ȏf�ӞA���Z�37��nSX=<OR���:3�uzd��:q8���8fݞ�`1+I=F�ee�q���8[G���+���3���&n�g�t	���|6u9��:��oS�m͈�� |�(�ൽ�2�iW0����,о�w��K+�z+�L�֛�N�Ѳ���esG�7���zi1P�R��0��-R��s;�mQ^X�
���*�Ba&5�uJ�J�fޭ�����zR��/��!�'騙#�ne��8J�b�n�]����Eۛ}ɬe/\f���H$�<Ji&�֞06��K۷v����_����jL�JP�$�ݷ�z�VT�mSk�� �Pg�@P�s���6e=��f>�<wJ�h׃����W��51�Ϝ�S.��)Qj'u�vټ���h/k���B�N��y�$ۘ]+��;wE�4&�*:��ږ٩�Ҹ���&�K)qȉ����p�C������[�Ȁ�e�tFn�w�Kn�7��M�*	G�H��<%����+5+>"��\sU�*���a22!Z#B�mw�Mesf���8Rp���������oј�1ɦ8�D>"����ڟ���ܜ=y����~>+�Y�������h́R{����a��Z�ٕ&F����]�W�WF�瀁�ݯ���:!�I�I�e�$��"�E)=pb��AM�)&�=���5Pha܎̚Y�F�~��n�*�FB����D��IM��#��SnZ��Or�L���s]����ӻ[j|�+��W�O�9����G{�\%IbTG�B
�`Ǒh�l ��L˙6�rê�x�(S����+�-,���@��Yd����?����>�n��#��)�b�Ջj����]\�������^J�WAf�V�!{ZT��_*�g�&/�L_��p�����w�*(����\k����İ*$�tL.\6z�����|5I�$��n�Kq��loA��/����G�)�Y4��T�4yl-�cS[��#����W�G�ɦG1;��D�E??�����qE �l�0��2n�~��:K2��hG;ڕ����k�O�^�3y�B���!(���ks![>�>�H���
m0nI� *m���(�o��n�/+o$��%�(�[�����Ɨ�Ui�޷�A�t�5��)�ٸ������D!�]ب�z����(9"��Z�'ִ3c=x�t9~4�Y־6��g�Q?����`�-UF*����w�m�u�o�ٯ/��o�j�\��}K G)�үʑ�粰��X� ���@%K�1'UI�������U&ձW3r���DL�w���Sݼo��S�̬$"A��6��6��@���H}�@)�B}�@ľ|	[�5�- w�<|h��� �M�m-���k6Me�	��l�������a^�MU������E1������v�����r�������;���_�u�11E�C;yn�S���p`_j�s�P6����/Ǔ��W�jX��b��RHA��\BA�Vt|a�#x9�������+��eY�H\oa�џIH�f�=V�:g$���\�Q�&CEx[�	�+<��"MVTƣ�:��O����ǅ��nG��
�Z�y��?��O�vT���i���r"��UHt�G0XI�q^?Z�Cf)_[Z��$�L�ce-�D����;"򅱛��!2Q�������p�n
o`mO�Dp���)�y�-4łD��u=���{�'T@�^�)-����h+K6��q�9���r�@}�"��^&c�"L"�x��A�!03��X�����������S]ds�<N�*.��{�P�
����j��% �{٘��Ɂ�[�U�M#�p6��E]���bW�@j��)��T��pz
Sϸ2yK݂m%��&��S��V�B�71h+FF^Ű���\�8�d����@l��� (�X�����.n�R�i�ux�W��4��[[����M�I�v�Hf�ߩ(Ki���GL��ɴ�%WT~�r�Jy\�x�6��\��2c2��f�4�o1�m!,Y��G��%�@0�0�k�ڙM�~�ݳ�%��?��Yj�s%���q��:�֮k�ֹWUb��#�*n���}iC:T̩3uET#�i�i#�]�"Ó�z}��uA�����g͓��'��]{�����������[w/���ҡ��~�а8���y�P����=��&$�n��>���:G���[��+�c��]:M�j������o��}�����_S?V�#��u�J�3�&fz�.�*j�݅�b".���%S����C�\�0��"
#�����Цg�a*��!�5� �oڤd�]��3
�zh�8�k�G����5�D�.E.�a��d�o�Tm*�|��52�JYYa��\�)߿!���� ��{�T��7���ן��Ɇ�A&]���
���̈T�T��Z�	ǖ���7A*��-�8�䉩�n��aɒT]~,:��O���N@�-Wnq���b�$!8	Q|?JJU����躗	`�`#�֕�a�zX6���
�K�Д1טAhxU=֓�c�{�=G���w"P�5�;�氦w�0�����7v��ن���qݞJ�E��n���ǿ-C�8. ��ĵ[�<\O�/+�T��a
�b����:��&E�5�P~M�\i���,�ƓU��zA��!�BM!��7'T��y�
JHZiI��2)G(V��9`nX�v��?ߞ*iI;0F]�ʔ��r���\��
���w.��b�C��E��������;�X%g�T�u$.�~�����W�ʗ߽Yz���מ~���'�C���	��ΛY���yViS��.�����_� N  �	���n��u�(Ϻ"a��^��[<�PZ��ҐR&���)�o!w�E���&M!�a�IT�r�<��ى#=؃#�����Q;5a�*)u��>M������i����˓�U���0���S�M�/M����k�3x^�*�΢B3E�GE�Kc<�.�7���y��Bu���n6�i׈�֨z�������ZAxZ�XA�yF�"��J̪��P�+�N
Z�.J�֮���/��kx/H��u�6���a�t\�nB(�I�,k�h�9�$J%dx>Y�<ۉe��r7�� $�n����$b�x�Q��Q�_���j��r�p'W�V������l���P-�S�������N�U���ťzITk�-4��I�]m�����D��}mpEo"�>�.�o�}�i�[ºf��6�.
{���'m��A{�ۙ14()��p��bU�2�?DU[�y�@C�l!t\�/�C	rC4�>�=�N��Gd��<������^�@T��� &I� @Њn�
$wE����M����>�g�8J0ZR�eb ���N��i��Y/̪�a,�{@��B�m������$�A��>ukQ�)���Ve�.$>�v,�u*�>?LH8��Hs�Mɤxg)'��u	�w�s''S�?��;Vs�9��2�hz�H���`L޲]s�-�M��Z�'�U����a���L*z��
~���	9��3���$%g�]-.	]�d8��+`�"�A�A�OH���Qҗ�P�`��-����:>��0���L���=Dk/��>.����^�����I[ݍ�?\{z�������/ݾq�pr_5�g�C+̾/��ӕ���(⇟-�g/R��2נ�$2�����Zx?�r�$�cj�5J�7D�
�ɩ������o���Vy\���Y���ֵnU3w�]�sXu�Ko�0cr��g
3t9t�O5�Ϡ���`+�".������)6c2� 7(���=갨Vq?���̾�6�������Ǐcލ#Ӝ �L)=��iV�*��݆�xS����՘ĝ<h�Ps+z��kF������I���I��ľ��Kخ9�[�	�?��]1G�|u���U@�rZ��ª��7j���T��Mf�U��4�F�^}"��\��*�^��p��	OJ��q�A����g](&��2�uXO���[K�q	6�dk�~�R�M��X���>qhj�a�+	��	gU��S����t0�n�1woxmՕ��v�0R����	�hU�Zu,	��T���d��늈{j�Y3/��0V��F64%��l�h������Sc��d Ώ�����6����V/��O���?���fݱ�������iۼ8%f�/=M-�B�V�F/8�R�ObK�Vf>�Y����,���ku�~�E�4�u�����́����)�3�m���}Ok��l\h4"�7*s��k�P��le�"-��`�v�x�8��R~���-+�!���^ѯ/�>Ev�J: 3�D������$�O�x�n�=�W�ܬ��5��'����J�G9pb����"�C(��Ѥ?�>��"���W'^h= �"Q�����wH�<;a����s"���ͤ� L���P�2�"yT�Q�E���v���jN����Bm�z�R�V�(́[�h�
=2<e�sd��$^f樥�"�% N �Y�,����:q͋�����GW�}�����=�q�ɍ>����W�~�|�K�ӣcm�i�䙆E����5r�D}��TqE�RR�<���;��a�:О��BoJQܨfovm��6L%�A�Zư^�B�N�?Ik{J5��<�CM'�o#p$(�:��(B>jԴ��z�"�<�JB��p���
�0r� ?���F+��%�miJ���kT�ʐ	ԧ%��5�H#�8�ס���*�Ȉོ࿀��H vߤ�]�B$Xm���S�:�����?����h��^��C�?��U�L��d�՛����Fv����V\{���0��3�M,�vr#�5�������i�˦;Us�]�)��,�"
���,S/��G��c��Z��6�3l�AAP��L�}��A�1M|e$~��1����B����m��������JO�:ܼ�F���%�ף:�Eɹ/׮���R:�!ķz6���2ؚ�����r�)>����μ��*��*�!��S&��i>��,����j��U�jQ������K��F��e���8�|��Ƈy����Y�h�hL5�Ksʵ�8�}��2��@!�]����y��:K�F��\'P4�+��c�_GK�ļ,c�(cj�O3�W���cU��º��N.�g��b�?�\�u�gkf[$�|�<�|S׫��e3���#��$o?���>r̎�Ӱ7O����i!��քϚUm��b�m�SЀ��2ݰm�cs�7)�4�Yޫew"����DM��Z}�1�M����\����I�w��u��)U{>Ǔ� x�_���8�G �9�	.�^~����o�h��>|u�����[w�_�v�����ۗ�\��}~���K%�<���.�����g9����R ��-�s�]��,4+�Bِ��U���[Bs:<C=��U*NZ�f;�_�	Ϸ��t��
�i�j��2���q�wA>C����#��Hщ�d�(�������*���щ�T��7Yh$�
��e����Bz�M��m\�LJ:��;AN]NY��k@%XN?���?X\��5(^Ѓ�nb�O�_� /VCz�4#~������a��HZ5�D."ķ%�ڌO��Fkj6'Ro>0N\[K�$�NIq�ɯ�=��Y�l��Ԧ������M�C}�9�%_��aV�B�6�v��]9I����dRC��K٬� E4�os�7�W�5[h�	!��d���+e���B�Y�:���O�Q�^��s��O������Axq��[js!ŸE8����LD78;�g��Xm'hS��y�WzH�_�Z@tf��?��n%�	o�|����.���!ՁmQ��э&���JV���!1/]�q�G���nYhI� E&�D���(atL�[Xfe��U�Pl�LeY�K�`\a9=s��v�ݥ�Cy���	�[�(�P7۟��� �3�{�iV��c�Q}�8�mw�a������i���UQ���GI2��.���u�1/,p`A7�^��(����5���Fھ�2y���1�5䟩0L��N?gKN��꩙�<QI��3��<�z�G�;�
�[~���:Iy�Ȕ�R�Z�5hߋ�V�ޮع?��Ɂ��=��??��M%n�6���L�lIM1
���B4�\�>�����U2�S��r�B���P.s�;���a���?��x,<�����7�������ō�7���o�_�����6o��{��^�|����賞      �      x������ � �      �      x������ � �     