PGDMP         2                 {            Overnews    15.0    15.0 (    /           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            0           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            1           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            2           1262    24590    Overnews    DATABASE     �   CREATE DATABASE "Overnews" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE "Overnews";
                postgres    false                        3079    24647    fuzzystrmatch 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;
    DROP EXTENSION fuzzystrmatch;
                   false            3           0    0    EXTENSION fuzzystrmatch    COMMENT     ]   COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';
                        false    2            �            1259    24591    ARTG_CATEGORY    TABLE     )  CREATE TABLE public."ARTG_CATEGORY" (
    "ID_CATEGORY" integer NOT NULL,
    "CONTENT" text NOT NULL,
    "CREATED" date DEFAULT CURRENT_DATE NOT NULL,
    "UPDATED" date DEFAULT CURRENT_DATE NOT NULL,
    "GPT_ID" character varying(200) NOT NULL,
    "API_ID" character varying(200) NOT NULL
);
 #   DROP TABLE public."ARTG_CATEGORY";
       public         heap    postgres    false            �            1259    24598    ARTG_CATEGORY_ID_CATEGORY_seq    SEQUENCE     �   CREATE SEQUENCE public."ARTG_CATEGORY_ID_CATEGORY_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public."ARTG_CATEGORY_ID_CATEGORY_seq";
       public          postgres    false    215            4           0    0    ARTG_CATEGORY_ID_CATEGORY_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public."ARTG_CATEGORY_ID_CATEGORY_seq" OWNED BY public."ARTG_CATEGORY"."ID_CATEGORY";
          public          postgres    false    216            �            1259    24599    ARTICLE    TABLE     v  CREATE TABLE public."ARTICLE" (
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
       public         heap    postgres    false            �            1259    24606    ARTICLE_FILE    TABLE     �   CREATE TABLE public."ARTICLE_FILE" (
    "ID_ARTICLE_FILE" integer NOT NULL,
    "ID_FILE" integer NOT NULL,
    "ID_ARTICLE" integer NOT NULL
);
 "   DROP TABLE public."ARTICLE_FILE";
       public         heap    postgres    false            �            1259    24609     ARTICLE_FILE_ID_ARTICLE_FILE_seq    SEQUENCE     �   CREATE SEQUENCE public."ARTICLE_FILE_ID_ARTICLE_FILE_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public."ARTICLE_FILE_ID_ARTICLE_FILE_seq";
       public          postgres    false    218            5           0    0     ARTICLE_FILE_ID_ARTICLE_FILE_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public."ARTICLE_FILE_ID_ARTICLE_FILE_seq" OWNED BY public."ARTICLE_FILE"."ID_ARTICLE_FILE";
          public          postgres    false    219            �            1259    24610    ARTICLE_ID_ARTICLE_seq    SEQUENCE     �   CREATE SEQUENCE public."ARTICLE_ID_ARTICLE_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."ARTICLE_ID_ARTICLE_seq";
       public          postgres    false    217            6           0    0    ARTICLE_ID_ARTICLE_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."ARTICLE_ID_ARTICLE_seq" OWNED BY public."ARTICLE"."ID_ARTICLE";
          public          postgres    false    220            �            1259    24611    FILE    TABLE     1  CREATE TABLE public."FILE" (
    "ID_FILE" integer NOT NULL,
    "FILENAME" character varying(200) NOT NULL,
    "SV_PATH" character varying(200) NOT NULL,
    "MIMETYPE" character varying(30) NOT NULL,
    "CREATED" date DEFAULT CURRENT_DATE NOT NULL,
    "UPDATED" date DEFAULT CURRENT_DATE NOT NULL
);
    DROP TABLE public."FILE";
       public         heap    postgres    false            �            1259    24616    ASSETS_ID_FILE_seq    SEQUENCE     �   CREATE SEQUENCE public."ASSETS_ID_FILE_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."ASSETS_ID_FILE_seq";
       public          postgres    false    221            7           0    0    ASSETS_ID_FILE_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."ASSETS_ID_FILE_seq" OWNED BY public."FILE"."ID_FILE";
          public          postgres    false    222                       2604    24617    ARTG_CATEGORY ID_CATEGORY    DEFAULT     �   ALTER TABLE ONLY public."ARTG_CATEGORY" ALTER COLUMN "ID_CATEGORY" SET DEFAULT nextval('public."ARTG_CATEGORY_ID_CATEGORY_seq"'::regclass);
 L   ALTER TABLE public."ARTG_CATEGORY" ALTER COLUMN "ID_CATEGORY" DROP DEFAULT;
       public          postgres    false    216    215            �           2604    24618    ARTICLE ID_ARTICLE    DEFAULT     ~   ALTER TABLE ONLY public."ARTICLE" ALTER COLUMN "ID_ARTICLE" SET DEFAULT nextval('public."ARTICLE_ID_ARTICLE_seq"'::regclass);
 E   ALTER TABLE public."ARTICLE" ALTER COLUMN "ID_ARTICLE" DROP DEFAULT;
       public          postgres    false    220    217            �           2604    24619    ARTICLE_FILE ID_ARTICLE_FILE    DEFAULT     �   ALTER TABLE ONLY public."ARTICLE_FILE" ALTER COLUMN "ID_ARTICLE_FILE" SET DEFAULT nextval('public."ARTICLE_FILE_ID_ARTICLE_FILE_seq"'::regclass);
 O   ALTER TABLE public."ARTICLE_FILE" ALTER COLUMN "ID_ARTICLE_FILE" DROP DEFAULT;
       public          postgres    false    219    218            �           2604    24620    FILE ID_FILE    DEFAULT     t   ALTER TABLE ONLY public."FILE" ALTER COLUMN "ID_FILE" SET DEFAULT nextval('public."ASSETS_ID_FILE_seq"'::regclass);
 ?   ALTER TABLE public."FILE" ALTER COLUMN "ID_FILE" DROP DEFAULT;
       public          postgres    false    222    221            %          0    24591    ARTG_CATEGORY 
   TABLE DATA           m   COPY public."ARTG_CATEGORY" ("ID_CATEGORY", "CONTENT", "CREATED", "UPDATED", "GPT_ID", "API_ID") FROM stdin;
    public          postgres    false    215   &0       '          0    24599    ARTICLE 
   TABLE DATA           �   COPY public."ARTICLE" ("ID_ARTICLE", "ID_CATEGORY", "TITLE", "CONTENT", "PAGE_PATH", "CREATED", "UPDATED", "GPT_ID") FROM stdin;
    public          postgres    false    217   �2       (          0    24606    ARTICLE_FILE 
   TABLE DATA           T   COPY public."ARTICLE_FILE" ("ID_ARTICLE_FILE", "ID_FILE", "ID_ARTICLE") FROM stdin;
    public          postgres    false    218   AK       +          0    24611    FILE 
   TABLE DATA           d   COPY public."FILE" ("ID_FILE", "FILENAME", "SV_PATH", "MIMETYPE", "CREATED", "UPDATED") FROM stdin;
    public          postgres    false    221   ^K       8           0    0    ARTG_CATEGORY_ID_CATEGORY_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."ARTG_CATEGORY_ID_CATEGORY_seq"', 53, true);
          public          postgres    false    216            9           0    0     ARTICLE_FILE_ID_ARTICLE_FILE_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."ARTICLE_FILE_ID_ARTICLE_FILE_seq"', 1, false);
          public          postgres    false    219            :           0    0    ARTICLE_ID_ARTICLE_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."ARTICLE_ID_ARTICLE_seq"', 8, true);
          public          postgres    false    220            ;           0    0    ASSETS_ID_FILE_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."ASSETS_ID_FILE_seq"', 1, false);
          public          postgres    false    222            �           2606    24622 !   ARTG_CATEGORY ARTG_CATEGORY_pkey1 
   CONSTRAINT     n   ALTER TABLE ONLY public."ARTG_CATEGORY"
    ADD CONSTRAINT "ARTG_CATEGORY_pkey1" PRIMARY KEY ("ID_CATEGORY");
 O   ALTER TABLE ONLY public."ARTG_CATEGORY" DROP CONSTRAINT "ARTG_CATEGORY_pkey1";
       public            postgres    false    215            �           2606    24624    ARTICLE_FILE ARTICLE_FILE_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public."ARTICLE_FILE"
    ADD CONSTRAINT "ARTICLE_FILE_pkey" PRIMARY KEY ("ID_ARTICLE_FILE");
 L   ALTER TABLE ONLY public."ARTICLE_FILE" DROP CONSTRAINT "ARTICLE_FILE_pkey";
       public            postgres    false    218            �           2606    24626    ARTICLE ARTICLE_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."ARTICLE"
    ADD CONSTRAINT "ARTICLE_pkey" PRIMARY KEY ("ID_ARTICLE");
 B   ALTER TABLE ONLY public."ARTICLE" DROP CONSTRAINT "ARTICLE_pkey";
       public            postgres    false    217            �           2606    24628    FILE ASSETS_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."FILE"
    ADD CONSTRAINT "ASSETS_pkey" PRIMARY KEY ("ID_FILE");
 >   ALTER TABLE ONLY public."FILE" DROP CONSTRAINT "ASSETS_pkey";
       public            postgres    false    221            �           1259    24629    fki_ARTG_FILE_ID_FILE_FK    INDEX     Z   CREATE INDEX "fki_ARTG_FILE_ID_FILE_FK" ON public."ARTICLE_FILE" USING btree ("ID_FILE");
 .   DROP INDEX public."fki_ARTG_FILE_ID_FILE_FK";
       public            postgres    false    218            �           1259    24630    fki_ARTG_ID_CATEGORY_FK    INDEX     X   CREATE INDEX "fki_ARTG_ID_CATEGORY_FK" ON public."ARTICLE" USING btree ("ID_CATEGORY");
 -   DROP INDEX public."fki_ARTG_ID_CATEGORY_FK";
       public            postgres    false    217            �           1259    24631    fki_ATG_FILE_ID_ARTICLE    INDEX     \   CREATE INDEX "fki_ATG_FILE_ID_ARTICLE" ON public."ARTICLE_FILE" USING btree ("ID_ARTICLE");
 -   DROP INDEX public."fki_ATG_FILE_ID_ARTICLE";
       public            postgres    false    218            �           2606    24632 !   ARTICLE_FILE ARTG_FILE_ID_ARTICLE    FK CONSTRAINT     �   ALTER TABLE ONLY public."ARTICLE_FILE"
    ADD CONSTRAINT "ARTG_FILE_ID_ARTICLE" FOREIGN KEY ("ID_ARTICLE") REFERENCES public."ARTICLE"("ID_ARTICLE") NOT VALID;
 O   ALTER TABLE ONLY public."ARTICLE_FILE" DROP CONSTRAINT "ARTG_FILE_ID_ARTICLE";
       public          postgres    false    3212    217    218            �           2606    24637 !   ARTICLE_FILE ARTG_FILE_ID_FILE_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public."ARTICLE_FILE"
    ADD CONSTRAINT "ARTG_FILE_ID_FILE_FK" FOREIGN KEY ("ID_FILE") REFERENCES public."FILE"("ID_FILE") NOT VALID;
 O   ALTER TABLE ONLY public."ARTICLE_FILE" DROP CONSTRAINT "ARTG_FILE_ID_FILE_FK";
       public          postgres    false    221    3219    218            �           2606    24642    ARTICLE ARTG_ID_CATEGORY_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public."ARTICLE"
    ADD CONSTRAINT "ARTG_ID_CATEGORY_FK" FOREIGN KEY ("ID_CATEGORY") REFERENCES public."ARTG_CATEGORY"("ID_CATEGORY") NOT VALID;
 I   ALTER TABLE ONLY public."ARTICLE" DROP CONSTRAINT "ARTG_ID_CATEGORY_FK";
       public          postgres    false    3210    215    217            %   �  x���Kn�0���)t�2 )R"�s�-�l����CW�%ڒ�8�M�EW]=�/�IҢ�Ex#EA�?��"م��ڶ��������z�fS���e>f.���
�:fSh�e��7�����NyN(#\�Y�z:!L��޽<����e��Ṉ�+�vR8Ai��V�D|h&
����'^�T��x�W���J��wm�zlǫ/�˪�GQX�y˗���8��T��JnL[=lm�����-Ju�W*A@�֔	�@CHE�\���'� ���禫��ΨÝۋ��h�������q�����g� J"��D�`���-�7��� �(�AofsĚ��M�m4�*��&A ��Ds���Tk+U2�T/��:3��O��u}���}�˽���9�{�`xv~d����E�y�Ͳ�AX�)!ʠ��R���6����0��9Shk�e���R��$��v=�SI��*�˦�{3����Q�����-�nn��*	ZjP�UX�B�kI��A�٠������i@�Abf�W�#F�1�/U*y��8nM�̳��y�z�v�Y7Mg����Ov�o�i<-��#��uW�Ct�P�5f5Ǒ
�K�S���jT�ܤ2O�V�<����9�m�>���;ƅ,%'�3l�+F�՚0#�K%��>������Cx�      '      x��[�r�F�]S_��,f"XI�˞�C������=�^$��b� ���4W�����9B+�l��?�/�s�	�J��������8��nܺu�x8�C��}z�Ɨ}����������m�/*_��m���-�KŃ�w+��>ߵߵO��>h��p�*?�H�Yw�hc*B�wa厊��)\����u\W��k�����E�֡r{��J�*\�S�<�q!�n��,�i�B�� �O�۸b�:W�����s� )̀w_�elb����� ����o���]��(��2���'�Ÿ�C������>AQMH��]T���xY'��I}|��G,�Э����ka��o�#j�Fd��*O��(����C��Y
W��/|^�;Hv.v�#\R��=���2৺��G��vT���7۷"�[�U��^��ӷr���
�f�0��j��e=�����V��}�ڴ����8�嫡t"�Q� ����s�mq����tH��A�Ь]�C��j)����󔱍���㉫a:��J;�_�Kq���]������(۟���/8�Q��3>_š�d���!
���jtˏ-Yx%������u
����6n�
?�����ʅ,�E�]�*����Ϡ�6*O���`��5��ޟ׾k|J7�a���@�m�@��_��̞8Љo|k'�ED���=,_����R
Āx`�*��~:*����"z����'����%��O: .r�2t%��GB��]#o��장�,���0�c���A���b:�Q��o)n�o7�VйT���>�Y��C$��R�@  �|)&3��6�WL�g���x
G@֞�s���X��T�P�B���B�6����o$�_|��;y�?[ב��I��P;yC!�C`@بi��r��B���q�^��R��3�?�H4D��M���ߡf��􎈧/ɱ.��������w��Ҷ��o�^�i3�#�q7l�ky��na���%b�D�&�*K̆��9Ż�K��+���2aHd�Iv�*�m��_0S�t�<T8��d��v��E9s?�Z�8�@�a�x,��~v�������V�M�H� 5�ĚIun�����_-*��k����-���3Ҳ��b&�b�`q����������?����������ܷ�7�K������/�X�n���>;�u��8�ȴ��0��1���P�ɖ��ߡ~(JN�K�پg*�r�*�x����7�ڹ���@�UJ����'�u�@Y�p��B^��j\T��8V���,5��a<~�� J�p�=�Y���(^������ǇDKB���`'9���dޏ� UG{/p��=�ߓR1:{p��BT4��w_�1Eε4��V�@#i��RC�T,�(7&dSMu�Rxލ��n��-�/֠9�������X
G*
��o�r"�����;i����I`�S)�]���ԯ�M���Ga��gb:�[*HRۀw5��:�#�ܾO��V�.dx���u��f}�JG!�"�P�l�w� 'ne �)�p��%��l�����Y��;�if'i�#��Iʑ7�Y u��89�\@b����В��SPfs�4�^~�Θ}�J�Վ�k�dfɯ/���#o� I��$#�(rR�[R
���iN�FՌ�V�3f���/n��*1a�J��FU��>����.�K-
}�S@}QJ3T��+�Sx%�)������K�o|s҉ӌ��<An7��`���z�p�$��%�)�y�Z 	���T�<��� 5Y�-@��R�����<0�X�]�ŇF���xњgΚ(����<�C��`��T���:�hF�j*rf~�q&h  � J��ʚLjjUL��tt|)��>�q8Se�(Qh
�[�GL�~f80���{|F�e��>qt�ĺ�8�bT�$��߱�%����Q�Q���z|�U��{�����oʟ�x��|\_���|�,�K�V�8#1b�ǥz�T��,����M�(�q��%���;u��N0S��D�is�!�&ĩ� �0 �0hN'Ȁ�NG6�Y*i�B@� I\
�oE[;��xJA?'��a4~[��{n���u�a���Q��$M���Z��X+��XV����ṛ�;��}`=�@7󁋙��4�1��KH1�u�;R��0���VH�'�F�/�h�͟I�� �D�◠�Z^�'���ɯ�ׇd�;�J�A ,���a�`8^֡�*p��&��'��1E��EϕE�l$��t���y�5�������b7�ϙ:��N2���i�h��\�Yb����=D���/h)8O��c u���+������VP	�s���ܡa�n�J�b�F�B��D�������d27Vq�5@w{+�R`gi��������hW_:d3�:�]��L�����~87mZ�E�Ea���t^�
mvCu��;�.Q�&H���W}��E�2|�'fMb��ً��;��!6vRv:��÷V�/��6��#���y��D'��)�_���[��]"��j�p	<P2/�l��v�&���ڈ�z �f"�KcL�$��|�����sqcG�¥���!�^;�"�� I/�P��.P�^z�~�j�<��y<�)����NZ�҈@�;�^t	��-*�%T 
g�5��3ihױ9qR�&���J:a��}t����wC�	���$ (���,(�ߔz��^I%�Ӝ�j�Ľ*����%U��Cf���w��ܙI�Xc�:�s\�O$�E��<���}�q�&!c�N�5]�N\�N��\���Æ���!�}@9�W�d^L|��l�'X`�=��(���0�3� �N�"թ�t�Ɵ$�ܺ�GVxO���Jsб�.�ަ30�Qg��ή"ޡz�_�w�z�/��n<|t�^w>�q��������2��&-f��É�x�/
a�/ɺc�W�w�]��ج�(@�.'>�?'v�c5k7ޥ�a�'
ou���������M&fQ(1��R^�kֵ`�B�� ��i�:�Xz�b�[����ߏ+�NƆM
�f����R��>�0:OS��}�SL�QT(M~�B��-�_�6��0W�O8G-�b$�����Ė5�8�u�"�9>��܏��'d�Fe��%�F̅�w�;������^|������j���gJȵ2�1�lc�'�ڦA�M,��J[[ �<e�"�H=%,�<���A�Ka��E�e����Q|�����_l������b���C�]A�Y��AVR��C26�O'_�ұ}��H6�����_���_/l8́y� xO������9q?'ݦ*��L[�VH:�����B{�H��Z$�*~�� ��i5����GY�'I�C�ihk�d��\G��6"�mxD@n�|��Ћi9 ���$����<��.������c"����7�S� ��F5�zp2ߒ��0��l�S�qb���h�ܡ�-�L�>ulEz*�R�Qҗ~��B��9Q�紂4O�����)�W��N�1]`����W��Qv��M|؛�����:h��?�}�d�W�L�-���PA1ӟ!)�=�Cl�6}�)Ӯd�Պ�Lz6�d��� �E:(����	sER,����D��n#�@�IK��Ypww�͉t��ȁl�l�J;e�I�Y5�艩� ���������|�����?��ճG��7���OϮ�av>n��f�/^Ky�į:�z�O����e�!�7r�g���8G�i:ZY�z�P�̧Y�g�/���Q�J�F���W�,�>���̾{]��oO�����̇�ϥ� ��QFG�,��AW��v�pm�x͹��F͗�V��>��:]�9��r�	hsC|@,�^�l�r^��OB�׸u���'���~,г�$W�k��1�JJ7[�2Y���Xxn��s ���;��C{�n��UF�IyΝ��R�T󷚿��#�9�ܺҀ@c��ټ��m4o(?+��B�z�r��r\�E�*O���H��o���-G}�!������?i�}�8z�4� j  �j�:�5bx�<���)im����v�.�[�:���������l�c< ��5�E�7�����B����+-$��,�ڱ�t�C6[�Xw^ghK�v͕�D8��p?K�
u���>ܪ��;�7���J6� #?����G�W;����%�Xu�x��{��M���O�c��6�[!��^-�ҩ�d�A�w���˸�2NI`���z�.o���f�>�;�Z7rME���;2�!�a�~��R�� �}i��,�������B	����s����w�^�5���U�{�+ñ�8��M`�T=��I�����q=���7��گ1%�JZ���7N:M�ɴ`w\�)��7���$�D�Yr�W砝�Fō�:ڦ�с�L��(m�J[�n�s�".�R�va%�B���ܾ��޳�}��y�����7?��??}��\�{p�����>��dzX<�0�^��Y1�YH�v�o��<�G�]J�[��{O����m Aq� 3b�Vp��ܹw�W�{Im�B�&̑�[H/ӂ��|�2��>�
����jЈ�Y�X�$5��8,���B)>�LV�"rĩ"j���F[Sck`�����}����SY�6'�?NϼM����E�\X���P�~(��*h��}�W��M��������F���xf�V71��D�k�����MdRk�Y��
���ܴ17�>�&y�@d3�o�w�	�wޜ%����)�Ɓ_0��|t��Y�nk+"�z-3���2إ͑թ��?�k�@:?�]�yuwKg_%���U]Ԧ�˽��W�R5X�}t V�f�ZwK�`>��0Ƭ(HRWNQ�E	)ufA'�Y��;0Ҵ�R���V���l�;*䐨���A4�eZ���}����v��T�5H�n�R�
�l�b�l�i�R����W��p��}0������_�R��x>A�GX�g�UGm�7X������0dJ$�V(6��`IԶ����v+���2ʣ�:-M&��e�ϴ�S�s=S
7"gBRζ�,�:(k��-�Jh>��2���K���lW	��ÌS����|J�^$�`r%�ѡ3�	��;qB�i���ōM�󡝇�z�}M-�?���R)Z��4�����ޕa]�tK�%�;[�5݈O<�ɐ�B1& �g)@�	.�=��d��I��"�33T$�pi빾b���acYU��)�ڭh�Rq�בzH�@�����}��������7KD�|��`W׶ݳ3*BF�O"Ț���jt�{����}�����������m������k�n���%����^�Pײ�"��<�=��K=��������>@�����g�|3������}Wi�a������t�)��x�DZ�ږ7�D9�� (��ű�5U�m{<k$�<��Cr��.Q[' ���j��	f#IK\*���<�O�%�����ߞ�:ڸp;[�M)8�ȩ��?Ȳ����e�b_?H�?�bwtm_}u���e7�N�����
�M⮑���N׻��w7/fD�8�{�� ���$;�'k���D�.��F�_X��7[�;ʎQ��9x �ʣd�3}� ��1�E����z\ܯqqnUtڜ�t11�n��'��q:�Гk	� m��i��I }��j?$��r��Tuq��zw�V���G�S���o�]��U��څi�]�R���mʼ�f��mδ��y<9��%�p�_i\W��k��9��Iu�N�DL�)�	�Kp� �i�Lu��O��=�n�u�t��+���>t+�<����8��^C~�1�muM�cLYq��Gv9[п���Q�F��c��ʜ��̌0I��i����mfK��B��&
��eۭ������9�|�ɠnt�,fLQ&��'f��`+3�c]�ȯ��4�sAo����8��Qz�_T|�����M�[�kJ�q��<ױ��Ss9x����h�N��l���M7���ӗ3�l��%���:e�V���$��|��cG2��V(QV��6�屬xݳ�����|�$Į�!�<����O��T��yJ���i�Ƞ�˗��ﱰSYy�:9�G �e�2<�������fn�[�.�'�Z��'	Yt��,誋�Rd=����=���w������˿<��ǟ�����?�O^]���ڵk����I      (      x������ � �      +      x������ � �     