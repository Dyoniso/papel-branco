PGDMP                 
        {            Overnews    15.0    15.0 1    A           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            B           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            C           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            D           1262    32970    Overnews    DATABASE     �   CREATE DATABASE "Overnews" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE "Overnews";
                pg_checkpoint    false                        3079    32971    fuzzystrmatch 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;
    DROP EXTENSION fuzzystrmatch;
                   false            E           0    0    EXTENSION fuzzystrmatch    COMMENT     ]   COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';
                        false    2            �            1259    32982    ARTG_CATEGORY    TABLE     �  CREATE TABLE public."ARTG_CATEGORY" (
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
       public         heap    postgres    false            �            1259    32991    ARTG_CATEGORY_ID_CATEGORY_seq    SEQUENCE     �   CREATE SEQUENCE public."ARTG_CATEGORY_ID_CATEGORY_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public."ARTG_CATEGORY_ID_CATEGORY_seq";
       public          postgres    false    215            F           0    0    ARTG_CATEGORY_ID_CATEGORY_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public."ARTG_CATEGORY_ID_CATEGORY_seq" OWNED BY public."ARTG_CATEGORY"."ID_CATEGORY";
          public          postgres    false    216            �            1259    32992    ARTICLE    TABLE     �  CREATE TABLE public."ARTICLE" (
    "ID_ARTICLE" integer NOT NULL,
    "ID_CATEGORY" integer NOT NULL,
    "TITLE" character varying(200) NOT NULL,
    "CONTENT" text NOT NULL,
    "PAGE_PATH" character varying(200) NOT NULL,
    "CREATED" date DEFAULT CURRENT_DATE NOT NULL,
    "UPDATED" date DEFAULT CURRENT_DATE NOT NULL,
    "GPT_ID" character varying(200) NOT NULL,
    "IMAGE_TAG" character varying(200)
);
    DROP TABLE public."ARTICLE";
       public         heap    postgres    false            �            1259    32999    ARTICLE_FILE    TABLE     �   CREATE TABLE public."ARTICLE_FILE" (
    "ID_ARTICLE_FILE" integer NOT NULL,
    "ID_FILE" integer NOT NULL,
    "ID_ARTICLE" integer NOT NULL
);
 "   DROP TABLE public."ARTICLE_FILE";
       public         heap    postgres    false            �            1259    33002     ARTICLE_FILE_ID_ARTICLE_FILE_seq    SEQUENCE     �   CREATE SEQUENCE public."ARTICLE_FILE_ID_ARTICLE_FILE_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public."ARTICLE_FILE_ID_ARTICLE_FILE_seq";
       public          postgres    false    218            G           0    0     ARTICLE_FILE_ID_ARTICLE_FILE_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public."ARTICLE_FILE_ID_ARTICLE_FILE_seq" OWNED BY public."ARTICLE_FILE"."ID_ARTICLE_FILE";
          public          postgres    false    219            �            1259    33003    ARTICLE_ID_ARTICLE_seq    SEQUENCE     �   CREATE SEQUENCE public."ARTICLE_ID_ARTICLE_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."ARTICLE_ID_ARTICLE_seq";
       public          postgres    false    217            H           0    0    ARTICLE_ID_ARTICLE_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."ARTICLE_ID_ARTICLE_seq" OWNED BY public."ARTICLE"."ID_ARTICLE";
          public          postgres    false    220            �            1259    33004    ARTICLE_KEYWORD    TABLE     �   CREATE TABLE public."ARTICLE_KEYWORD" (
    "ID_ARTICLE_KEYWORD" integer NOT NULL,
    "ID_ARTICLE" integer NOT NULL,
    "CONTENT" text NOT NULL,
    "CREATED" date DEFAULT CURRENT_DATE NOT NULL,
    "UPDATED" date DEFAULT CURRENT_DATE NOT NULL
);
 %   DROP TABLE public."ARTICLE_KEYWORD";
       public         heap    postgres    false            �            1259    33011 &   ARTICLE_KEYWORD_ID_ARTICLE_KEYWORD_seq    SEQUENCE     �   CREATE SEQUENCE public."ARTICLE_KEYWORD_ID_ARTICLE_KEYWORD_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public."ARTICLE_KEYWORD_ID_ARTICLE_KEYWORD_seq";
       public          postgres    false    221            I           0    0 &   ARTICLE_KEYWORD_ID_ARTICLE_KEYWORD_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public."ARTICLE_KEYWORD_ID_ARTICLE_KEYWORD_seq" OWNED BY public."ARTICLE_KEYWORD"."ID_ARTICLE_KEYWORD";
          public          postgres    false    222            �            1259    33012    FILE    TABLE     �  CREATE TABLE public."FILE" (
    "ID_FILE" integer NOT NULL,
    "FILENAME" character varying(200) NOT NULL,
    "MIMETYPE" character varying(30) NOT NULL,
    "CREATED" date DEFAULT CURRENT_DATE NOT NULL,
    "UPDATED" date DEFAULT CURRENT_DATE NOT NULL,
    "ORIGIN_URL" character varying(400) NOT NULL,
    "WIDTH" integer,
    "HEIGHT" integer,
    "COLOR" character varying(100),
    "PREVIEW" integer DEFAULT 0 NOT NULL,
    "STORED" integer DEFAULT 0 NOT NULL
);
    DROP TABLE public."FILE";
       public         heap    postgres    false            �            1259    33019    ASSETS_ID_FILE_seq    SEQUENCE     �   CREATE SEQUENCE public."ASSETS_ID_FILE_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."ASSETS_ID_FILE_seq";
       public          postgres    false    223            J           0    0    ASSETS_ID_FILE_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."ASSETS_ID_FILE_seq" OWNED BY public."FILE"."ID_FILE";
          public          postgres    false    224            �           2604    33020    ARTG_CATEGORY ID_CATEGORY    DEFAULT     �   ALTER TABLE ONLY public."ARTG_CATEGORY" ALTER COLUMN "ID_CATEGORY" SET DEFAULT nextval('public."ARTG_CATEGORY_ID_CATEGORY_seq"'::regclass);
 L   ALTER TABLE public."ARTG_CATEGORY" ALTER COLUMN "ID_CATEGORY" DROP DEFAULT;
       public          postgres    false    216    215            �           2604    33021    ARTICLE ID_ARTICLE    DEFAULT     ~   ALTER TABLE ONLY public."ARTICLE" ALTER COLUMN "ID_ARTICLE" SET DEFAULT nextval('public."ARTICLE_ID_ARTICLE_seq"'::regclass);
 E   ALTER TABLE public."ARTICLE" ALTER COLUMN "ID_ARTICLE" DROP DEFAULT;
       public          postgres    false    220    217            �           2604    33022    ARTICLE_FILE ID_ARTICLE_FILE    DEFAULT     �   ALTER TABLE ONLY public."ARTICLE_FILE" ALTER COLUMN "ID_ARTICLE_FILE" SET DEFAULT nextval('public."ARTICLE_FILE_ID_ARTICLE_FILE_seq"'::regclass);
 O   ALTER TABLE public."ARTICLE_FILE" ALTER COLUMN "ID_ARTICLE_FILE" DROP DEFAULT;
       public          postgres    false    219    218            �           2604    33023 "   ARTICLE_KEYWORD ID_ARTICLE_KEYWORD    DEFAULT     �   ALTER TABLE ONLY public."ARTICLE_KEYWORD" ALTER COLUMN "ID_ARTICLE_KEYWORD" SET DEFAULT nextval('public."ARTICLE_KEYWORD_ID_ARTICLE_KEYWORD_seq"'::regclass);
 U   ALTER TABLE public."ARTICLE_KEYWORD" ALTER COLUMN "ID_ARTICLE_KEYWORD" DROP DEFAULT;
       public          postgres    false    222    221            �           2604    33024    FILE ID_FILE    DEFAULT     t   ALTER TABLE ONLY public."FILE" ALTER COLUMN "ID_FILE" SET DEFAULT nextval('public."ASSETS_ID_FILE_seq"'::regclass);
 ?   ALTER TABLE public."FILE" ALTER COLUMN "ID_FILE" DROP DEFAULT;
       public          postgres    false    224    223            5          0    32982    ARTG_CATEGORY 
   TABLE DATA           �   COPY public."ARTG_CATEGORY" ("ID_CATEGORY", "CONTENT", "CREATED", "UPDATED", "GPT_ID", "API_ID", "QTD_SYNC", "QTD_MATCHED") FROM stdin;
    public          postgres    false    215   �=       7          0    32992    ARTICLE 
   TABLE DATA           �   COPY public."ARTICLE" ("ID_ARTICLE", "ID_CATEGORY", "TITLE", "CONTENT", "PAGE_PATH", "CREATED", "UPDATED", "GPT_ID", "IMAGE_TAG") FROM stdin;
    public          postgres    false    217   �N       8          0    32999    ARTICLE_FILE 
   TABLE DATA           T   COPY public."ARTICLE_FILE" ("ID_ARTICLE_FILE", "ID_FILE", "ID_ARTICLE") FROM stdin;
    public          postgres    false    218   )�       ;          0    33004    ARTICLE_KEYWORD 
   TABLE DATA           p   COPY public."ARTICLE_KEYWORD" ("ID_ARTICLE_KEYWORD", "ID_ARTICLE", "CONTENT", "CREATED", "UPDATED") FROM stdin;
    public          postgres    false    221   í       =          0    33012    FILE 
   TABLE DATA           �   COPY public."FILE" ("ID_FILE", "FILENAME", "MIMETYPE", "CREATED", "UPDATED", "ORIGIN_URL", "WIDTH", "HEIGHT", "COLOR", "PREVIEW", "STORED") FROM stdin;
    public          postgres    false    223   ư       K           0    0    ARTG_CATEGORY_ID_CATEGORY_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public."ARTG_CATEGORY_ID_CATEGORY_seq"', 382, true);
          public          postgres    false    216            L           0    0     ARTICLE_FILE_ID_ARTICLE_FILE_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public."ARTICLE_FILE_ID_ARTICLE_FILE_seq"', 208, true);
          public          postgres    false    219            M           0    0    ARTICLE_ID_ARTICLE_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."ARTICLE_ID_ARTICLE_seq"', 235, true);
          public          postgres    false    220            N           0    0 &   ARTICLE_KEYWORD_ID_ARTICLE_KEYWORD_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public."ARTICLE_KEYWORD_ID_ARTICLE_KEYWORD_seq"', 267, true);
          public          postgres    false    222            O           0    0    ASSETS_ID_FILE_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."ASSETS_ID_FILE_seq"', 228, true);
          public          postgres    false    224            �           2606    33028 !   ARTG_CATEGORY ARTG_CATEGORY_pkey1 
   CONSTRAINT     n   ALTER TABLE ONLY public."ARTG_CATEGORY"
    ADD CONSTRAINT "ARTG_CATEGORY_pkey1" PRIMARY KEY ("ID_CATEGORY");
 O   ALTER TABLE ONLY public."ARTG_CATEGORY" DROP CONSTRAINT "ARTG_CATEGORY_pkey1";
       public            postgres    false    215            �           2606    33030    ARTICLE_FILE ARTICLE_FILE_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public."ARTICLE_FILE"
    ADD CONSTRAINT "ARTICLE_FILE_pkey" PRIMARY KEY ("ID_ARTICLE_FILE");
 L   ALTER TABLE ONLY public."ARTICLE_FILE" DROP CONSTRAINT "ARTICLE_FILE_pkey";
       public            postgres    false    218            �           2606    33032 $   ARTICLE_KEYWORD ARTICLE_KEYWORD_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public."ARTICLE_KEYWORD"
    ADD CONSTRAINT "ARTICLE_KEYWORD_pkey" PRIMARY KEY ("ID_ARTICLE_KEYWORD");
 R   ALTER TABLE ONLY public."ARTICLE_KEYWORD" DROP CONSTRAINT "ARTICLE_KEYWORD_pkey";
       public            postgres    false    221            �           2606    33034    ARTICLE ARTICLE_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."ARTICLE"
    ADD CONSTRAINT "ARTICLE_pkey" PRIMARY KEY ("ID_ARTICLE");
 B   ALTER TABLE ONLY public."ARTICLE" DROP CONSTRAINT "ARTICLE_pkey";
       public            postgres    false    217            �           2606    33036    FILE ASSETS_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."FILE"
    ADD CONSTRAINT "ASSETS_pkey" PRIMARY KEY ("ID_FILE");
 >   ALTER TABLE ONLY public."FILE" DROP CONSTRAINT "ASSETS_pkey";
       public            postgres    false    223            �           1259    33037    fki_ARTG_FILE_ID_FILE_FK    INDEX     Z   CREATE INDEX "fki_ARTG_FILE_ID_FILE_FK" ON public."ARTICLE_FILE" USING btree ("ID_FILE");
 .   DROP INDEX public."fki_ARTG_FILE_ID_FILE_FK";
       public            postgres    false    218            �           1259    33038    fki_ARTG_ID_CATEGORY_FK    INDEX     X   CREATE INDEX "fki_ARTG_ID_CATEGORY_FK" ON public."ARTICLE" USING btree ("ID_CATEGORY");
 -   DROP INDEX public."fki_ARTG_ID_CATEGORY_FK";
       public            postgres    false    217            �           1259    33039    fki_ATG_FILE_ID_ARTICLE    INDEX     \   CREATE INDEX "fki_ATG_FILE_ID_ARTICLE" ON public."ARTICLE_FILE" USING btree ("ID_ARTICLE");
 -   DROP INDEX public."fki_ATG_FILE_ID_ARTICLE";
       public            postgres    false    218            �           1259    33040    fki_a    INDEX     K   CREATE INDEX fki_a ON public."ARTICLE_KEYWORD" USING btree ("ID_ARTICLE");
    DROP INDEX public.fki_a;
       public            postgres    false    221            �           2606    33041 !   ARTICLE_FILE ARTG_FILE_ID_ARTICLE    FK CONSTRAINT     �   ALTER TABLE ONLY public."ARTICLE_FILE"
    ADD CONSTRAINT "ARTG_FILE_ID_ARTICLE" FOREIGN KEY ("ID_ARTICLE") REFERENCES public."ARTICLE"("ID_ARTICLE");
 O   ALTER TABLE ONLY public."ARTICLE_FILE" DROP CONSTRAINT "ARTG_FILE_ID_ARTICLE";
       public          postgres    false    218    217    3224            �           2606    33046 !   ARTICLE_FILE ARTG_FILE_ID_FILE_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public."ARTICLE_FILE"
    ADD CONSTRAINT "ARTG_FILE_ID_FILE_FK" FOREIGN KEY ("ID_FILE") REFERENCES public."FILE"("ID_FILE");
 O   ALTER TABLE ONLY public."ARTICLE_FILE" DROP CONSTRAINT "ARTG_FILE_ID_FILE_FK";
       public          postgres    false    223    3234    218            �           2606    33051    ARTICLE ARTG_ID_CATEGORY_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public."ARTICLE"
    ADD CONSTRAINT "ARTG_ID_CATEGORY_FK" FOREIGN KEY ("ID_CATEGORY") REFERENCES public."ARTG_CATEGORY"("ID_CATEGORY");
 I   ALTER TABLE ONLY public."ARTICLE" DROP CONSTRAINT "ARTG_ID_CATEGORY_FK";
       public          postgres    false    3222    217    215            �           2606    33056 *   ARTICLE_KEYWORD ARTG_KEYWORD_ID_ARTICLE_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public."ARTICLE_KEYWORD"
    ADD CONSTRAINT "ARTG_KEYWORD_ID_ARTICLE_FK" FOREIGN KEY ("ID_ARTICLE") REFERENCES public."ARTICLE"("ID_ARTICLE");
 X   ALTER TABLE ONLY public."ARTICLE_KEYWORD" DROP CONSTRAINT "ARTG_KEYWORD_ID_ARTICLE_FK";
       public          postgres    false    3224    217    221            5      x��Z�Rɖ]G}�>��������'		�7>BB�������^<�6���Uo��>."����O��0�"���3�7�ٙ��kߏf��B9a��?�����͖������`vB_z)�~|����56���$�������"��(��QӰ���l����<���Vɜ'VA��?d-��Es��?�O�㟇��)##*$Cd��5a�i.�B�w8K��Q�V�4��< �^��QL	"ea�SÉ��GK��%������I�݌\P��$�Ed�8��
��f�����<��0�f�]��w�f�k<�=��o�r���w��1�x�#�fGdp���4ARVx"�S4��������G����D��O&���Ӓ���-�l�J�O>u��_��Rb�ZwR
�=��!�
� ��jUs9�<�����ʊ m 9�Bd�e�d�Z�F������?� Md_J2���Р�8⹌$J����1���T��|&�a�Z�#�{e��Gv"����v^������A�	M��32yI�w��xҋ��%�h�)9���ȃ`71(�~��T��N-�Q��-�kv��!O��}�~LQ5��,Dt�јH^+*L�ʈ�Z6u�9�����K?v��
D��)Ek�M��
Zu.�LBA�.ٵu�9��S��?�vu�
@/�^����Y@��p��bE�䵃�h�I�NA�]�G������P����U*�����[21C��@���P�"۝2�L�W�@-c~�� ?�yD	�Q�=�DFα�Zfh7%o�Q6����l����,Y{�9�J90�B�� }���C�0'�Eժ��Y��B��B��f.����TQ
Ιm�t���~�A�(%ʗxҵq��pD��c642�������5?�����|�{�\��y~2z'�A�  Qg^�͡�.���^�$M;��6�_&]:��U��T9F��D�J-Z5�R|��?��O�qM�E*��*�F�Al����a�0�m�'(m��<VdJC
�%�1���2 ��sҐf�b�f6C�m���\g⬯K�`3�	�|��@��p�� �T{����x�/8���/O'��u|���a��o�*�H���nT5m��J1�a�hAE�Q@�=v'�MLQC��p"@�3�eD�����w��-��&���E����%^:JX(RK���ES��<$��(m���%�T��Ue�`�sI�7�2�X�����ɣ�x ���(/M�����;E�Yب��`�#���Z��ھ�t6���z��r��������c��@ܣf��jZ����6�`vM���P���:P4�NB�@�A�DJ}���<��wڗpJ��A�*TE��QT�����J�e��ݷ�¤7X]4*YjЖ�»8�͞B�dT��
�±5��
4�iH�	�Cch��|�
"Z�Rע�f*�����Uf.�DO��);�?�=��Ϛ��7$�\��f�.L��:k%���m����y������I�ٱ��L,�K�+��O�q<����-]�(�O&ʚ�/�)V�Lpd w�ET��-[��E�e���HADb�1�Bb�K�f�]�ϔ_7�Ԓ���`�üg����K��%f�m�h�v~9�??��r��z�O�g�o�/��i�IU���wk
� ��V�[v�m����bV4އ�3���TF�Js���X��^�����E��*`����#ڳ(h�z��k6W�I��fE iV#�aY\�Dd	�F)�}��=�Y��@@W*����x�� 5�"�Ԋ�p��yOR���ѽ���˭��9���>n��/���d�aEf*Q4G������zv'��U���u�t��"Ӓn���kT�k��ӌ#���=� ��$�o�M� O�)(�f^͋%�J�Z,����#^QF���?ga�`�Й��5� УK�������r?u{:�ivW�)�ub�S��ED	.��¸��[��ճ���ΰ�.yOW�`k���tp��{Z�棓����3��,r&�D���Ω1�J�e1��͙��2�vZ�x�#�)�t�`��SW��)�9��l�\=KV��}�S�Uk̆K1>^�$짂]��#��M*hs6����Z��g��i��(�k�vA��'���b\n�_��ؾ�د ��H=#�t�
^O�2��ԉR���- ozo������w�:�}���E��\��^Z\��F��/0�)�$@�	�A����@�hR��Bmnm��G�4�mX�����$X@6�JT��c �۶���Ʒ����@�p9I�3p��a�ˌ��8Q��܆e	U�5���o�\�MW B�cp�%I���#B ޣ�<.����3+�dp1h�me�3�!�*�.�6�;�Y��n��)?�L�G�������%-���FgUE0 e�J�J���L�x���m����<rw���!
�J��K������\����0���h
��p����4�̦��J�O�.�u��y�����V� +T[S����I�R� E"h_h�6�`01��rw^YU5E")(���p*=���!���o�<J~p�9v�`�/g��t�ep1x}�M�'�t���`jC1�H�(���$ht��"A E���ٞ�i�줲��Gϔ��f��:T?�D�Cȴ�Vq�l���[W j�F���Zm���2n�@�o�m<��!�Î&3I�"�`�d��D��y�~R��띟�̐�1���z��Ф��BY�Y:�l�?������s�������;����z����ǋ&j�t�`b`������a�1�pN˦AH��_��q���3*�x�;��IR���aYA������{D�:�u]���PGrR���ӭ�*D���?��`�Bl��][l(�
��Eb��&����F\f�300e9a�h�牵6x�Y0�u�7�y�O֘�ё�4:>7g}:9��w2��������	�*��5w:H{�������������'���_%"(��x�\Dh���nX{$�d�5�q��ߣ5� W@r'�9|���~� G/&�N�ek_�RĖ��E$m�!�0��=+׎�l��-�*��K���쟇�hx$N�ΐ&os�U	�<���zj�i���Z)�o]��5X\nM_&�l�f�xg�x�'W?V�u5Л� � ��D�W�V�mv�����?c����◈0h-Y��#b���b��̿#��o��?��iP�+%�Z F8�Ql��%hS�&Mפ4���eD���U���ʃi<��S"�����Z��ןNǣ����,Q�D5�Spd�P�=�}�BD�5UZ����i�]'j�0��y����ϋ���(��w���e�,|=�������)���I���L�����v|2<�:.<~�{<za'���M����h iJ������J_��K�@X��?N�;?m�gL,���j���4���G/�L�[��y�r,V+�%Z�SϘ�=`�P5{}D��՝�m�}ܱ�Y8�˗����^��Û�x�� ��@�6*l[ H!�eD��,�Ё�u�y:�����?�����������gې�z<�C���XT����IQ���z�x䯿�M���ۍ����N�_��|ok~�h_�g��5AV˄*�l�a���㼵L��_�����t����x���td��~yg�R�����IX���S�]�0ۭ&i�l�I���b��t�^�/'g��ѹ�����"z�I`�YV�M-] �E��)���v��z��?���	x������؈����/�fx�[���ˬ*���s=�@���~����6f��?��T<�o��[? �_?��VMF�[�/p;�y=<|���No�E��qk�izI�@@d���R'	�	iJ�S	�����d��a���s?�B�ϳ�o|�Lw��}:�����싵�o��?���ׂ$�27ܣo/(�@"�y���ܚ�{uDy��k�wh������MH҄���s�D)�g1�֯�4u{��'��&�wk]ϯ�4��ĠS�4� &  O��h9�Rs��|L��o�W֏b˅@!ņ��$��X�M ۵����x�Ɂ�|D�6i`�\�h	�U΍7�=-,<N�Tu�y�
O)�T�@i���%T{L.͜-Y��fc���� ��X���6T��C���1�~4&ldty�e\�ɇ�lcH��6���Ie%�K��UVsS��!K���j����[D ��x	��YX�vO-k��YԷ7�B$"<��"@��U�0�B*�'(�7G��'��t��;�@,�i=_�P�����(��wp���_~���'n�      7      x���ˎW�-:��
�p�s� (R�=(P|H,�%R�=���{x�=<��Q��3�?P�4T�F�3�4��|ɵ��l���L.P(%3#���l�k٭��ܾy��?�����6m�|ؔ]芶����r�����(�{��\�ʮų�[��㷾,����C��i����{[�����˪.VeQW<�F��֫��ٰ��)�m_4�E;�eW�7��2=��ɐ�oڴ��^����Zo�u��n��t���(��O�l���uM;ǫ�]����#��YX�/>��>�6��� �+6��6�(�,^e���I�s凰� �!t+N��/s_o;��X����j�
|b�E���J�U��߸ ����,�R�(���dH����6Ȍ�`ۂg����7Y������]��e���|H5�<�j'���Z��<*�~+�//�e��kB/����ߵ��?t_d/���o�,��Z> ��t��e�
öœ����e%+���?=r���.%>P�J�2NaS���%�atR����A��+�����YV\-J��(����{�oEa##	���VAƾ)�#����J'vf���T�s�o��˱(���)�i~Q�,<SMX�U�u�r�d��.��}���M�]��d�eA�xd4���V}_5�{r��m�������ߖ˒���p�a����]��+����R6j��r���RV���V��W`+�#�c��WW~��oXY�����/9�7��g���ʋp&+#_^�N��6�L���=�Q<ƕ�u	�y��^Ά\�&Tr:zJ�]�z����2��<M�&�ܫq�W��W]6��rOO)���A>��L�;�~�A�D���]��2aYVrv���-��UM��7f�Q<緗�<���f�j����.�_�U��lЍ�Q�w�������g,��3�M�'ǵ��^ʈC��� ���J��F�\V�}��j�,��p�����-؍�ܐ�S3��~y���ɹƵ\��W�p�_4ay>,�_&�u��L�.�3��]'�I^���͞\��Ӏ�1�� 򾮰rȰ8���X�nY.*�*��I�ܐEx��R/_����h�=�$R6���îRi��dHr\D���T+�Wf���>�]�μ�ߚ<��Z��k�܁NuE3�dE r(�j� �.��������T&��s
�%�æ� r�?�2��_/[=g��r-�m;^�Ӳ�.qpwʕ^�.8�.�!Vt��-��f�Rt �c�c�zȥ�T��˿r��'�eބ���xI9&�M,�ηh<���Mt器:X$?~z�D��M"���h��r��z涬'�n޺=�yk�����e���w�>�~�=�>x���/�ݺ��_~x�������p�0k�WE���[7?xv;��{�P7�O)<��K][Y����{�)2�߽��  �v�ԫDN+�X�o����m�C.:[
�M	�RL�E��t3��BQEJi�h[� ��Y�ԐPܟ�i� `��x�z�5$i�U�Z������=�>s�<����Z����3�(fю4wԔTղ�2�Ύ���JD~:�=�<w1���֔\%Z >%�AݴEiO��.��"�]~O@���wM+��ٺ:�����l��J�;#
O�b��4�`*:j͋�{"���Av�ܤ.���`g��w��M\ �m��>W��82m
:iB���{@t��9��L>���&��UYؗ[��DX�
����E�'-�v ��~�0EI�z��Z*�6z®914
�C ��^}1�e�*�Dln�I�+W&��:�%�O�v[�Y���m�%Xb��v���%�U�M�iA��Q݈@(ǋ�KcQT�9}�?�2U[����[�	�vB��B�ƮTD�&'��ʮߔ�-������j���t�3N����K�U��i&��%�^����w��y�G������b�6!!5
�Al�A�l��TW
���%P�|�S���9���hꗢXES�d�̊W�^����F��]��l�JB|�J\\�~M�������'<s8�X �@^W�Z�G�5��ۛ��kQM��5N�ʏ�l3����P�J�.��H
�m��x��6�T�� ��ݑC���+R-�J����(��"�]@��N�a��+�1'����E�ΈL��T+ۀS]
��gf�Ʃ��~�~y�hI�K���e��£��)?�W�]y�Cq�=\�<�UZ긚�ڹ?�ls���������������>x����Oe�'O3)r���<�����y!Ӈ�}	Aw�.Ϻ���N���,. ���|��l��!ݍݨUfX&��8^��X-�N��������䢿�mi�ʰ�:ղ5��/�|Y[^*���C;���t���$s�D;@BC��������QRCB�K�V�'p��X��� ,/Į�k�� ��ښC���&.0��_)H��WA��n�،f��q�f�4�_�ޝ��S��z�.Kw�a��[��r�>�s&J�����Y�(HsZ5UCK�����ZïcRu�fb�\\'��O��h�>���'��F�0 7���K�c%������;)bn�(�2�][��;��� ��ð����*���/�N�ؾ�!_.p���QQ�a����ď@��[�]9���Xꁸ?(�����OЙ� �r�����v���\�Ǆ��"�;8�ԷW�u��Q_v�V�aRb�[5�GZ�a\����.>�_$O5(�M0�^�_N��Y��f���%�wa�o�`�5��YZ�=G�:��'+��ޯ��."@NR��Oi��@�Z��6�v�Ɍ���؁�s=N�iU7P��b��� k�X�.<?���P��!ݘf9h.�m��l������J�9!Cq)h^� �-,��\>�l������ϙw��@���$_�Vu�\��T�pw�] i!��'�C<!����*�s&RG0U�����:P(��U����;��]^�I"J[�0�RP�n���BFeK�풋`��X8�������ō�� |7*tY�v��pV{N��� |/l[J6��(�姺֐}|�ba�A9�rȲ�p+₹V����4<�u�ç���[�s�Z��2�_s����ӯ���$��¦����$@�>��z�rw���Z#����LQ2�t�& {T��;�*<�҇���K�M� ����7����P�{��o��A���/"�)j�h��[%�u��`���"[S�7Q��U�	�ׇ�M2���W��u%k!�a�/9$s��O����w����"7�,�|e��SqP|�o�������������妽��:�����֋�N0�{����;�l��S�PO�z�?��X6��y!���){�4m��̭N4D���և���Z���x���P?�q-MCڬ�%.��� w-��8��ߢ�0��@M���Z�*LƝ��j
��Rd�����N��J���3�[e2�1&`����V��q�� ��t�쑟��@���\��c��+Dh�cZ�#�3�V�P]I#��:o���8��l�p����6�+f�sV�HiU#�h�X��1i�8��[2�+@C��*��{sN�Po����b�ޏS����|�[��f����jSW2G�(���M�D��m��g�nr��t�i`�4HJǸ��j=@׫��1âm�x�� Dt��hV�?�J?�M�)F���=|h���Έ���d��	���� ?(���vD�gݬ����j���L�d�D��4s1����b�0�v6����+���8��i���g����[�Z���J�x.�xɅ�XUg��|�#\��s��p�?v������M{4q�;jU���=�`W�����C�9�-���Z�7�*=@0X�-O�Bo�@`�0�@3�ʸ�͛��������~�"��d���ԫ�G𴇄��Ayli�Qn�юK���p��yzj��ZG��R��_KY�E���}��3��y����@1ԌZ����<�{8I��܈fm�ac�)�m�
���EIk���+��N�^W],�    ��|��
���R�#���:�o�蜣y�sݓI�_�ڒ?Ͱ�ʑN<b������Q<9\n}G�F̐aFf��ߏ�]� �e�Ф<to�:�3cS�w�����[�(ĳ�Mя殈��p������<�s��|��'���^��B\�~z��'��'����e8����w������Л�[��> J{`)#�y"p�������a�b/����P<���>�B�n�P6��G����cr��NIw> ,b9?�~�&󅘯�w��C�I��e9����}�A�7���5xM�6�.�"�@���vA3�3h�(L��L�Cui�c̚�A[�C�n�	V�yao�C�a���c��(*m����{����[�S����D�)8R��V�>��A>�NoJ8Ė�K��>�ؚk��y���y�A�p^����i���*.�[Ŗtn�_^Y��=�ί������B�+��UE?��Y�cw���(�g�f#h��/�?�~[�
�0���w����w�����Y�n���o�P���o2�w�N*�K�F0�q� f�C2 ��q�Ȩ�}�\�`D�U�J����>I�
*[��ʟ8;�K�����P]�q��D��[�S�EZ�yC�~Lйv��/e���_��W�ۚNP��m�4�Gv
��e՝�����^�t	�����_E+�w�]�*�u����sJT!��}Zk`q��+�S���M���Kȿ�/��eTH�CK���Vp�!6���!�J(��R����DW��ܮAp�X�u�>�D<��V��,1�JYځ�x���yT��/����9�zhO�۶�5��g�=�]�Y���U��h�E����J���~����H$���)u����n�%²\	h{�d��z.��v�#ج�\5=��WCw�,%B����3�����r��R�k�p	�x�=Mb+��z���S���d��t��.�4��l=u�7�3�epx!����Y��C�w���"�Y����r~&)ͪ��c�(�T��5 U,�X� ��a�#����\����� �a��Af[!�4ڼ�#��,B��s����+��]X�wNV	/	N�0��m�ɹ��y#hi�
�l22�}��Fv�{t����������p�|�ò������/��<9�"H�n��0�y��''�/b���[��Q�=^3?��7N
��zhV��X$.����n=%�4/�%�����I�j��T��G��� � crb�IO����
��I�N�E[0En�; s���XҰ�p�1`��ZJe�!_�;��Y}�?�Ϛ�Z�U���^�Ӝ(��k�ǳ6��,~yVf�if8=�����[uX�]�y<ro�W9�a.��'t�40emȅKKƨ�g��^LpZq�̹/WY=��K��}���#r�
��S���;��%A�l�I,��mc�+�2���B�:��8�/8�:�i	7a�<�1r�~D@��#����#1�k�XU���!Nh�5�X���4�� �Јxw���Ad�G^�j ���0'�#7>c-+K��S:�q������</̓�'����B�5��U�$���ԬX�C�����tH{�x�s$<"M���v�,�HuYu�$�$�6��� ��q��%(8d,��쬠�$M� D�_M��.�3�Ǜ�����'~2#=f6ɋn	�y���qbn�P��(9Aj�/��m�5a�z��SN<)^qc�5�G��Y:>s�G���q�9K1Ft�r�=E���Z�kX�a�90MV/�4��[:�gW.i 0=Ln7��]�dўU��X�ִф�Ap�Z;�� I��=X�� �x�-=^���.@Ú�th�7Гg5YiQ�
�3����jEf	ϤqP�lSnm��^��o��'� I��M�^�FCu|zv1FE�tL�4�pEE�KR�C�h�]�������@�O��1Xm�z>�ګ���LU^�յ�i�n�Ɵ����TFI�E�:�m�-�itF�,⇑��b%��U�iLJ�rn[�s_��
�[��Wp?�s�qaM$N��a*�p��=�߱X#T�I���� �j]�oz\c�k�WW���r�>��2iD[�q���5��ӯn?|T��/_���ɭo.����o?:���ġlz#{0���~_@�G�MY���,;Hj��eݮ�0rx>௨=��R�ܡ��6���7��E�L�~�U��������k�;B�0˂`�9<�s=��ќ�4�!%5O��Lv#qӫ]k���}^mT�P�KQ��l	Ř�&u:-0�F���:��I�z���bE�Օ�la."�n�a]�L�9^�݆f� �g�B�9�(45��lU"�R��ͽ� ��>�s�Q$�іH���ּ[�C���B�q�m��c��aE�i�r��;�}ǩXT�ɏ#µT�&�����!��"��q�g�֗:M�Z@����Pq��f��w��mZ��i�)x�'��Jc/��c�}�>͆��������V�!���-�L��>/s�������T�aڡ�J���!�iS��1�e�YTr�[~��*�\� ���}�U��`f�l��W���`��������j��g��B�k��X^�۔榩�zLkg���"�C�
ఄ�#�7�2�1�k�C�
�/a��9��O8t��d%)��fa�ڱ��U�#������vX�N�_/؂j�I������ɫ� C�bC��Y���^��Ytb��f�L�ċ8+�.����TD���f�����5��Z��%v�3�Eq�-�;���}W�fBD����r���`
w9͞��bIYd�N��~�Y��x��Ɩg��FvE������ѭ�s;d�4��N"
Pň�� ��y�q����"¨Q�荳�)�.�S��\�L�Mh�y M�B���:�O�A����Ǥ��(=l����sUf)3��7�����r���WA��3���WL�aa|��r�b�8pl������$����xt.��%�A�����կ<����#S3G�?:G�C���j͢A�yK0'z��)���hS7�Mik�`��l�ZI�Et��4�;ۇ^i��A��\�̷���ʴ�#?u��iM᏶5�׶��`�Ϟ����>|�x�������W~���_|���>;�� ���;'��a�o��������5��!}�/F�-r/Uz~�I�
�a�Y͜J������N��&�#-�u��YL�� ���&z��ƉhTa�F�R��*��0]!�w N��הo��U�	�H0�S��gaU&���'/ʹ6%$���A-�#k9�̀�(����+�F�Xe��ƌ��u尶;�}��vga-�8�QL��Eu[{|�ˠ���v���S!�R�9X�=�pi�M��[��&��y��LA��QTT�B��D��6�`�p��� ��{��[���V/vJoF�|�����)T�B����91��0m�@ul _v��>Z!�V��|�����PI�E�3^:�߈�6���u�9D����i�E���sd��0x�P=�ط�L�/��ڛ�UVm��	�v�}ְ� ����J@W1��	���l�n��I�����2\Ⱥ:ROՎ�_����+��`��^��1a3�T #c=�7%΢��̀�uSc��uk��C�ɳv���ʺ ��(_Z���W�?���d��}m��@R-ӧ�����ԋ��c�ei�\��<v�G"o�Puff�iX:�ӊ3�Ħ\�q�3�n���٪Y��EV*(rX���,�-�w,��M;u.^y��n�+Ճ<V�Wi9�ICu�*���W\R��^Q�z�M��tˈ�F��r�HS���1���s6Vs��R-K�Oեf��^�ˤ�RN� �X�<?\�����Ba��|���v~J=�H�,��u��ǋ�>8�X7��{͓o�~{���We���ɑ��?�+�#�� QU�s]�s�i�3�t��U>�|��;*\����UM��4}҄}`�m,�ɞ9*CW���=VM�OPk�55%)P��0����F����\6�    .:��( \�W�
��:+��ٸ0��EGTh| ��
J7�����
V����}��b��ylOM��#?�ʹ�,߁��+� �EC$��0Z����z4k^�A�T�hί,��̟�q��h�����V���.�:/���ڗ��˳*�S2{u�ye-���"|� ΆX��Q��ѧ|��\A��{�[���J�
Is�����$��b0oF��c�����8Nb��m��*�Z�u?���)(,��{3��mxQ�aa�z~�Re�����rV��2�ʸ��/&:�3�A]�<C��":7��	�o��V��7����6F�ڴ<�X��7���?V1��˖�ծt��r}�)2J�PL��bH��=�ȣ�'Z�	&)+dd�G9��I)�y2	;s"*��f�p˚��������&x{LS�L�bM�@хǵ�Y�]���iT4��}��&S��&�)���j(�W����M'yWbi��������PZ���ˬ�*�t8.������e�i�#����\)E��m���跸W�Y�z���)x���r� �6x�ݥ���rN�{#K���eqc��g#�ľ�2��5��/��|�^~p�����;����ۯ�Û�?=)O�8�PC���L2R�oz��O�
^��Hy�+�!�f�Y�w��$O���J��9BϮX䰋'L}��v�z���r���`�@s�9�$�Բ��?H��%�=�}��|	�&#E,o��Xv���,�ro
EA��T��%s5�Ii�+q+~]g��3%຺lw�?��"}�u+gH9{c>+�%�а�&{�|���!�>�^/��buja��������3L�>�����x����"Ϲ̚iE����A�m�Ґ:�JX_Nݶ?z�0�ZL�+k��ˡ�W�ȴKt=�Sؖ�1�P�#ۯ_R��Ǆ�C�*s��bhY�׷�-|-S�����;�=:��>��
�����.^V��n�07���fa���*�Z��\��%*c����A%h�d@����6�v(�V}p���ƨ��[�D��Uj�Kbcyd��8:��k��w�%�Ļ+5�`T�A�$[�+7&3w��$�[~�AA���=T\�^W��D� ��g�Sj\&ӑ2�<.P��W!�����z�LU� \�+�溹IS�,gXSpb�dOԲMG���t����}�dQ�d3�!y�������9�MF��Ʌ�h�M�M�E�	$������x��@=���m�v�Օ+O��3����|Y�T3$��]T�)<w��#�t����Gj���4�@t���'���_6������ׯ�;�?|���g�޻�'��Bq� ��hq����d��,��?�J5��=�%l�c��L�zN&��e��`4�� AP ��E4Ĝ��s�tڊ#�m�����敨#:2�ww�\yD590u��تUN^G;VU�+c��ߎ�Y����1쀷��ىŪ���V�<≳���s嵋�G��@��j����1������a�CKGS "�`]`;^v'4`�����c[0er2c�C��V�x![ʶ�K���P��;�C���2���e�vc�l�q�|�Wo�kgՒZ�ۑC!&����RY��/�V��H��	q�}�˃�P��U�`�Db"���!����u�؀��8�Am��OϠ\�50���U��]��v�Tj䏊_D��f�-D��P���+!
�Q��Ps�VdW��
�02��~u������h��cf �C��lÑ�I���$]Wj�l�,s�|�z8Ӻ`�׀���{q�:o�*R�����ִncxxB���	F� ��^D��ĳ�H���"�}����ְ������q�Xf���'�E����2�K�_d�G����)քT�s��̧J�>��2)<�L[q�����{�V����>� �g&/�	M����˪��~_�	�Z��c��֪Íc�r��8i����{���+Kx�$D��^d��BV��6Qk�x��uya{��)��B�S̯�QC:F���:MKLr���ڊAۂu/���Z5i<�'
Z�Ԇ74i�L\ƴQ�pU�z�z8B"x^x�iN;�uU�� ��2�R�4$�R������G�W�@�Z�����*�����#�tDi���9~�_��! 
���)!0v��ul���>Q)�F����h�z���3NQ���H�$�r��]��G�u��֔"fwh<\�= �)�-k�U�L���(c�ɞ����+�E�W�3���K��q��������ч�����_ޯ>�~}��\~����d
�؇ҋa�:�׳����*# ?�\�g�wN@4	�{��S�j�@�R
�^Y�oX��;\'�pF�����å%�։��89а��3�㠭ඊ�(H�,�I9�#%�C+�su~\v�C���D���Ղǽ
�%�@��-�+��7�ס�h�N��Yn!���٩7j��?���++٘eaeP���ǌ܈�?TZ���2\ȫ8��xt�4y�5����+K<�{���FH� '+�R!�
�C��χ��-���͘�EoS4�s�Љq`V�T��-�����ǌf�����p��5��J'7A��nyNQ`��١����|�^C�8�"�5��:�:�7�Ak "i��(	E��q��x���I��ƆY��^��6���J���GMe,I��S�!4���͵>}-�[�X8X�H]f�9r2���Z��ay.n�YSJ�q4"ri {�f���09bE�����$���UA!�%@M�Z���跡b��Ws� �����^�V���0����a�uL�pj wضt1�iS�Dם��v�gB+�Rq��t�b`��9��~��kl����[��1�t�"�ݲ��-ϫĜ��8���.V��=�������A,I�h�k	�D)�N�	�@x�6>�X���9�U[;��h���)TN�j�T袾�H94N;˥�()�����e_y2��ˤ�G�*�E��9�)��B�\&sT�7@���r2<2o�|����h�@,�5h���~�����M�f�޽��>�}Ք?>|p��(�ӭ[7On�� �qGB��F��e�U�uE^��&s��K���#��Vb��  ZVqk*Po7�[�뒸q���UK��)��\�CD�4PTO�xՎ�y"�܏����%G�Z�_w�����݋�h�D��?y�d�ޕ��4��m��y�� Q!QG�ޕ%�g�8W4%�0�Q��p�4� x�[��.�x�=��(d��iYX ��vQ&h�qa�ɇ@��u��<o��+cN��v�����u�B�[o8�cl2�%�?I�]A�W;g�����+���j���<xh40ˡSa�X2�]��١����^J��'@e �L�[#T�`l��}����{
樀�.�+3�%�*м�.�'��p7��Zԥ	�?h�#e;-ٴ���^5e�q��P3��B�����G�Z��R���E�CE�J2UC���yG�H�v��g��%�&��2����cf���.h֕Hk�0�nK�h�$�=+2�,q���Ҫ+O;6I�)A��EJ�l��U�w�w�� b�J�a��Kv\���֬��%=�-2{�4�Kצ�GW�j �4]������Qd� ���o�5/X���Gj��Ƭ}�i���
45fD�T��J=#�k,�ke�J��Z;��ױLI#��OE}%Y6ُ�����(m��~W?F���6�O:�H:�3t[_�U��1%A[��+\/���
���+�d��5��(s�s�S��q�!���K���-��\�a�x�BѸN������@N�������o�4H�drv������"ݵ�Jŏ^��^�	>�Gݢ�$�O����)�@Е�K1�H��!����&��~m#�Z=j�N���I%lN�,Nf�FPZ兢K���{$�=�A�U���(EY�;[�\�����+�c������������/��?������[ϖ˓�GƔ`�"\���ܾ}�2MD�-�S���8�������b�%~��T����`\����m.#`sL�4�����k��y��{��F��*��*�� ��:�$�#�2\z    ��z�C����e3�ʹI��ާ�g�U�--�%qR��3�䁩��mؘx��!d�,��I	_�"
C�JW�:����U����7J�,��TQ_�ױ���M��a�*�D�]VHq���6�چ��uH�\��+�ۣ��)��/�R���"�돍�1kdz՚�P�k�1N����o@k�$r�z���bF��9�ﳺ��ZC`���*�8xzZĮL�c}�eCҔG�i��_�Ézg)�c�?�0RK^�>g��PX7;&N^3����W�]��'���/K�&���Z��ꪡO�F�6Q��Ҁ����m/�W.��(��Cv�C3]�y[��P��\�ƣI�m�˞,6j[��� %�Br�0�~[Ŗ�+�k��E+�'���R��Zk��u>:�	�~)(��s��Ao\�#�F�MgS��R�C�A�ت�E�%Y0�Hە�S�9<n33�`�~H�U|V6UOGf+*�4(�Rw.��-�s=Eᙦ%���tw�ŒI�k��wZ�E�DςRqM���Q��0\��E�����p��J�B,�h��)�ne����U�,WNM���1m��v'���_�0��~Կ��B�}� Ê��gOK�e�41�'��y�:^,��ۯAխ���n>���'��z����_�y����o6'�oO>5�Nn���R�[6Cn��=V%͎2�{���p��8�O$��i�5�YO-�����`y;���_h�ɭECAq�ȓ��P+m	ϘY�a`L�<�1�ZE���pE�9l��b����,Y_�����@ a#���<gQ����F/ٕ�Us� 5"r��1�*��țu�y>�Gh�k)��Ȇ�y%4��,�co�(P�V�J�[�;*CD�<P;<���\���Py�z��PB���Ʋ����:�Va[�SFD/��T��鹇E�b̌~]��C�Jc����4�=ө�7ŚK� yK=/l1��V��l{*�úLg5������^�hO]��\���J����n�E )�u��-c3lT1�y)��_��uF$I}�Ȥʸƥ��[��)�E�`^��Z;5]Ǭ�n�O>0�Z�ɬf�X�_�w�L���,��}�S +Q�Տ��D�ܞ+��,��Ƿ��"�� 9)�����{�����%^�I�ۦMiJHt��#�T~�y���қ1�p��.e^
�%C���;��V�����kX�о��:����ѿt��]#�͑k�ؑ0�9N�N���
My���i��U��h�މ��0^�:NNn"n�/��0�������x1|�?Ə�s��75ߞ����i����狏�棓��u���	=��-��m���Z����A�c�U�پ��e�H�h��L0D*�^�;s�\a�dSf�=GHf�ĬO�1H�Ɉ���COrp䳭���.�F��E��)���a9��c����H0C��+��Z;r��6�ڮ��b�M�<�J��D>��:�'�a�l�v5��gVk�ޣ�|5�nc9T����WF��k� ��@� ���l�����d!�[�Rz��r6�"���o
N�H���/SŇ]��}*ڢi�h�Q���#g����R̬}��g  c�&���f�S֨�=���j���'������rȩ$�щf�o#�=[+j���Vl�;���H�k{X���2�GK�9m����eq88��(+�#5P
M�y��ǽ�ܙ��ZY$�WZ���N����b@�Kl��UJq�UWL�JS�(ceQ��x4'�oO;b
$ y�LZ�X��Ӿ�h�ޠH;�j6���[듕/�.LB�f���BV��öeX8d��t�l���nȈt���rw�Y�l����I�G<������ɸÑ���"Ta4@!�d���=aa<#��a"�x�(�_ǚ5��S��d��u�Í���  kC�����3���ðJ����;�ʍ͸zM�Mҗ�E��$c�5��q��q�����/���'���6��9�Ut ����)�Zk�u�JH�n-\������M�_:�z�e���>l�0Q�y��Xm=��cU�F������f��F��qQ��#����R�[h��_���4��d��ej�2J�1�F���hB^������IJp��W���I�����П#/��<�r�5��������^t?=����o��u�賻�����$a��&$�F�+@����wnؽ��˺D��nע?������z�=�w�y 0�⎹R�l�]Gk��	d^��2w�QA��#��7�����* ��T4�EL�0g� �(U���B��ԓ��@~]��]E�Z�g����_���4.�,���Z��d��e���������
��4K35��o��(_$V�SOt��֤�Y�3Z��Ua�ƅ����`�.���\1VWۈ�DՏ��-q9��H��H��9C�ذK��h��v�'w)M9ի�ۧ-@/6���}���0t�$�-]#�ū�	k�����^TݱJ��,��(�lA&���]�[��K|f�J���BI��ڔd~�r����V���Uo��@ьU�6�j�@�{1cl�mg�)4)٠ Bȯlr��Q"��7=Z8�Z8�v��e5��)�:FZ�c�����'��R�i���8���HO|�kQ	!���=��E�2�����Hj�)Z��qH�O	����T1z{b��U�v��$�f+�U�����<ӽ��ң��T�4r�Sr凘�Ł���ϛP��Oy3Q��	���þ��	)?2�k��uu��{fmǲ>,%����Q`��xQF�i,!?lJ޲Q�5��?v�r�;�:�%�rJ�n�ۑ��X��+_i��vU�-�cU�����	lZ��fI�����UK�����i��:�d7�����gǘ_��)���M��c��b���{.�bÉB�������z�$`� /��㊂ˈ�*+$�]��̭��R/�$���N�\�cz��I��,C;�:qN�¼�$2�!׀���_}���ן?������Ϟ^nN�~���rx:�킻����r&��|ֵ[�4����BFk����BVd��x�B��׆l�r�,b�>m|T����v����.S���sh���h�U�i8�s�m�p֯O��N�܊��6+��FD�DF�%C�W�ϗU��>�elzfN�Q%$���܀T@�ݗ�(��d{�+*��Xϡl%=7��p���T�L�贪*�/��8F�xCIz�ml��|�Dِ�Bk�����}�uu"_Y@�������|qP������/P`bw_X�����֥һ�l6�����՘$����Yξ�2#g��4�v�ƫ��ܚ��8#~O���2�lu0�3��2�2��ƙ��8��6�ݙw��sq�bN��֓\����>�=�9��1�jiV�3�aGn�7m<>Z�è�R���,���c،������
ޒ�IJ�c,+Vr-�������UgY��=��Ps��q��	9��)YC���� .�5�$C�>+���W

X);Ú��u����0pF�0��i۰�z�0��[�@�#PO'��;��̲��Dˮ�#r�:v���h?m\�O���b=����ٕ Zr�D����y�u�p��o�'��� bQ�=%hp*���ѵ1��V�ׯn�^��U�w����C@���mP�ק9)�<��#�����]K�����Z� �X��M��b��3�IO�z͸��c�,r��#:E᐀N�%K*���Av��,x�du�\��Uu9�bh�y����O�w���^~t�a����Y����}��轋�'��J]�hCd��s����[�ݗ��s�Ŭ��s�i�1�KK�ͩ��ԝ �}��ߨ$p,^�s*�Rkz��^aC�.uD9�]�,��r��a$h¬�l?����Ǡ�����=N����u$g�|yK��t��1��ZŔ�S֤v8���%"���	�휉��X�:0�Yx�֛���X�{�u˲����4�F�F��Eů>]/��ظ��{o�P��^����{l%�7=���^��%c�),z�1cyjF�~�9x}ŀ`,#{��p&k1�Qv��C�
�����k����%��    =9U{F<�z+�g~'�����#S�	���,vQ���ČE�
���g}��U�J��2��~X&�ݰ�|FܪCY�f�K��:�]C��n��	��`��;�X5�X�JP]�2�.�-d��US��1\�V5�밳������7f�r��f}��_��~�r�!bUz[�5�d6L�{1�k����J��<[)�[�(q��&�-5�8��G�CY_�@���Wd�G��t���B`���t�����cR^Ε1��N�H{��S��8����Q;�k%r>�K�-�C/�[D>47�*��O�[&7I㱎�b��j{JOKn�mSU{�C��F�i���³��q5d9���l��s�5�PϖA򊶭%쭴`�j�^K��LHZ�eb=�-�W�6r,b�Mi7"�dX��e���1.F�vͲd cWk4n�����x�����bݯ���~m�Ϡ"/4�,$o�e�K��F�N@�}̐��\�����$"wp�:tg�ɐ����iX��	o囙�H��g�����~^���=�l����b����ן�X�����N��%������'t�=b�㓶K���A����u��T<��j�ᓀ�E�Z�_^ڗSr�J�_٨�A�<����=�Yb�w��!��|
�8E=�챠�=�>�)�`(���g���}�ee�����?&��<|Ed\e�-���[�i���]%�9��i����e�o����
@k���>���,ͬgɸ���Z�hX���5e��I���X&�In�͐��1��nY���zmn�h��7�]�ĉ#��)��T�����ʒ��:�j�e�n�u�:S��`�D�M^�Y�}<o�1�,���Y��|�ÁY���Mi.'��J���`��T
T�:b'!Җ�x݊�r!3S�F��;1���͕ĝ��p���\�+��5)�?�Z�%�5��T�n	$ZM�A�+%��ڙv�AV2�C����0�R�,�$�w��^߹��ɍȳ��hG?����_��Л�� w�Xc�b�-�WC�8@OX�k��H��Q &%���2��"i�R�,�K4�	�f<a"[^DB��� �V�Ygl0�`x'gB!�4~lL* p1���͙l��5ƃ��e^�lk`([��C��;/V��m�d gL�_k��6&��ȇΜX�B�b�+��ꡮc&!(����[Y�Ԭ)6�q#x�H�Z�+��S�k�1��&f���s��<�Ma̽�Eɾ4�I�v��~��/�/n����샧�Ӈw�Y|�x���'W��~Gt�����W��Щ�Zt��TxI����8��bu�EM$C�O.(�D>Hj������ ���b�����J�s����Lji���8����@�"�z�w���S�CXY���z��`>4�e�k�`*��p��2�l^�!�Qq����D�0m69�
�7�82T�D>�)��?Vה��z��9B��V�4�^M���w��
4�G����cJ�x��1Ζ�KS��57S*;^#g���|(l�㈓�����X���KM����3啺V�5(�^o_��1�$L�l2  3jE3"]�p����%i�^eҪ�z�s��q�^ �vX[���E��v��NL(�AH�1�;�H[tʛ͜�ˊ�]u��9&��Su����Y��5/AFGjXR����"tax��+8zɡYp<��:T0j���r��[��F��
<QU�6�A\���J����/�66���E�*�tS#��pgE���D�A��E����ם�ʌh@���k!��nL���ӿ"�Ң0B���7�O� �+p����,o|��Plz�};l���gKV�Y�᯸aD2KE�������.�8Q h�t!�
�����/*&�/ 8\���}���Ǉ��w�峧���p�=�!�p��'Q�g�Z\��G����N}�ie�P-����`�Ӡ}�_VV2���I�n�������g�\ήΚ�!��6Ƹ�uu�x_��z������|n��?��_)���Lbs�ֳ����L����,��Lq�59���=�-��a~��,@5+bL�Z�D?�df�k�݆Wp@��c�ĈK��'�'I��,�]kD����Z�G�|��=�buwUjm�;:I����M9���mF������eN��'��� V���ٹ��)�^>�Sa[�P�"��x�#�\,+��b$D�T�H��5�7b;��#d�)=����X�H���i��������h�p>�;z���3���8��\�N���Ɗ�>������2G�ʉ1��-� Dl�����x+Z�(��Ο���k,�r�4�G�\ݲʜ{�CnS��xSfNձԞ�6�	���,Y�>��	�iHC3�7��k������N�4{sPr6*U�<ݾ*��H�i�8���	
�#*Iz�䍄�-um��+)'�.����R�m[���UP�<X�M��Yz]�E^=�c��a�5G��i܎V)�걟Ls�A��� S��Wk�2�E��d�L�C/�%Ҧ��j!��@A���A�)��Xi`�#/Q��Nߞ<y8�݆EL� U�ɣ����^���t5�i�`"KHm!��|r]R;˰�څ����I��#��S�3�n<˨ʩ
PD+�V�]GwZ�?�^�J�İ�������Ii���=���*g��3�8^E?�̋���f��ŗ~�P9�@PCa�Tg���ym1��pM3e�?��V�{f����Q�Ā����eH�'{62� vz��'�,����p7RͮY�>MB��(WRoz�L����{��Ȁ�d#U��k�V~��Ly��x���+�1�k�*����U�%k���&��~���<�G�N���uM@vaCX�벩�����|t��ه�o���o�Y�={����͉�E�L�?ݺ}S �]u`=6�nx�>� �����@�gކW_FV����g��0s�8j�&l�u�����m[m�/�3,�,H�֌�ioO5\� ��T�tIe]�h�G��d�p�Ya⑞1�������+7�k�X������yBDg�ʜZ>�q�뽌�}m������:�Kk�����"�&I%h/@�)���q����r[yj��R�*�<�ne��W�0N�8�u��ͳ.:�\V{bi�q�+�����ӟ���%x'Jܷ�<�Q`� �7i���`�8��^��#\�ŉIp��єW.�S��W��^B	�L��M��?l��L��4�g�Q8x�����������ʨvy�1��?��L�lQ=p�iŹ����Ĝ�k�k6EH��Z�H$є�}����8iJ�Yr�գ�m�rܩ�Kیw�[������2�ח�F��,��גi&���C�l��Ǘ�g#�5����y�k�"�\�{��|�Q�ET�G�c����-�q������4K�Q�Ք+�L�Х��Q�,�dj�?�K(��:�-�>����l���h,��re��N��Jq'D�G��,kh�|z�w�ι���v���rX����-�]�i��Gm��Q�>jW��'Q��P����>�5w�t�lgb�7��d��Z8���8z-H��顙M+��`�ad�pִ.XZ�-ܼ�ǅ�S��E�����W�����O}���a���O��O��fs��?�gl �>�6��	JzOP�SG��a_��81�����#W���<��W�g��9�V��hꌆ��pxe��5R�&�B���o��#+Hb�I:6O�U��F̫e������Q��q�{���ȥ.M�qJ �w�u4\ԓ�I�x�yN�T>���mޟ�g�� (��2�[�!U�U������
��J�Y��
x���UEk���t��&�B`�������'��h�q�R�Q킂?�V07i����3��&Ӷ���	�ܕGӗ�����Ʋ�N���(�=����>S4�h�ёVS�Bm{�!TC{k^�JZ�[VHc8d�	�P��a�_��W�'3�ֽ���=��^�ƺi�>�j��l&�VD�Y`����3"���Z��}��kqT�$�9�X��i���W>}�0�mA��,˅���{@�}��Z'�^   ��A<r��E�[z5�9`t��J־�#�Xl���J�X��QG�����W�1�vqʣ�Im�҅3S=j�l��~1���y*�\�٦rz�?q�Z�ɤ��]:F���Y$k�����xU�|[={����Ƞ����|�?%��$vy>���7�s>��0#�$�H^,��[DLW:YK�~�J�:H�ƺq�8�f`�+Ō���Vؘ|>j��*�k���	�KSj�OJ{���0r�]!O
��"x�B]Y�� j	�iIIU&Y���wlqbz+i�ǓJ����ka!/.�Z2�(�0uے����xA�|ݺ��"�^���#+�j�>���U2�򪩇�:Dαn+�{�|����λ*�p���'U�����?���l������t���'S 3Q%�n������=�����,�G"Ż6�w�X�3����ێ�N�+Wp�j.j,�S�mH̋��ka��A�Z�f^j�z���w��f�-�יô��%�y��4�_��k}��-�Bdl����u-Ui2"�����1��T�������ӏ�_�sɳh�� �4��$*�F��v��O��ł|�R�+QQB3&���O��C�6<@�{6��j���ѥe�0�M_���5��6I7�:򞎢L�^���.�d�n�'��s�~�i>���I ��d�D��3���+���Q��@�%hqO/z� ��7^9�A��u���'��L�B���Q�S{����c'��ޣo��|���~�)���Y+2.H6:_j�|��&��[~!S�FKsd������0G��Y0�3¢�-C��Wd1"�o�k���R�L��0�����V�h�Y.D#�g#E�&��!ֽ�,
+�Mǭ4�6X�1
q��ja�D��kb����eN�Z�=�d��1JGRgy��h6&����u�<����
m2��,dR�E�JV���z=��{����-kƑi��;�Vĩ�M�Y(NԳ��+yVrΎ<�Z�� 8��i�N<^-���r 1	e��s���w�H\�%����mŵ�j�"\e��fK�^d<h��^α�j���^�&�������YW[s���9���V��0Mva���J�3.�i=sPN���6���T�#��	Og����W %��F5Gܨt�[��լ-t�r>&��2 \FjL5�AӒ����+y}<m�������y���ɮ��b�������?8��LpN��*�����N�zjF(>ʤ#7m�_��19æ<��{������J"��~�S�s85*�2>��ҕ:�DJ�u������=ԫ�	K�srg��m��%q?B�,*v~dse�����I� [�p��U��.~<���2���q	�j���u�8����.��0�M��Wj�6�GZ���R(���%bXn����|��#p�NxfO:�0���tD1V2��߯��ud��b��N;X���DSߕSr�X?2x
v�%qh�q-��)�p� ȱcr���=s�4U��g�¸�h]��`��h����k�$�QR౗���n*�`�V�$gХZ�ڟQ���t�����d���w@4��� V}�smZvn�b���Hk�x�e��h�9��ڔ3Mm�cW�̠^����FK���E&ܐL-�+�u�R��k���j���fc�~*T�\|Ə��o��Z#�i�,�nC,��n@4�F��9���4֠´�[ȕ6$��*�Co�Al��}2�0
y�2̕1��s�����I~�5͹�rL�����(����Q�	flƐ�ͫ498�%��o�����Fj��ы��oi��PCL@#l;`��O�T�s��(�[u� 3��B����>p, l��� o��^Άo_m��O>��nu����7_ܿx���͛k�xT��\&Ԣ�����^q�n�S����ϴ����O��.暏��o��%�hJ�Ї��Q&}̃�#k8�񼍹�����ͣ��e�E��xأ����L�Udd$���IeDPr�Q�U�V�hI�dm�0�D�Lǚ}S��"{s�*Ɣ�,Cq���06���nE$cK�?U��t��0��5c~3�e��q�/����6�Һ|����m{2�S#��L�1٣D�V��)��e�I��i�l���m<��If�T�	J�,�g��!J�:s�u�ʖU��]Ζ���� �(�e�y;Jw�i}��hc�ϫM+z�;�۠����!�̠̏���d�����e`.� �5x��3m}�$)
!�,��J9�AIC�8`ɇґg7h���hL�`{�T�&{''���⠹�5��*ݼ�)�WnQ�ߨT�4jϑ6�Z���#_�2�s����4�!�ʃ�v/�p��JE�4�i��G�����t�D��>�+�C��/�cӽ8cw�N�4��4�߷U��
��
�Іڣ�^��%�r��E4ʋ��"��h58���A�Ĵ����{�:k�~y��8, �=�Y�.�19u����칚�N�n|kڙ�{]���w>�t&g������[�yì�zj4$F�6�Ř��H��&ud
����D0�=�(�2d	��p]׌���~:����y�r�������G�|����L��;nO���|�_�B��^xf���zoXk�������IWX���F�yF�]�r��7��{OCk���u��U�|v��N�t"��V��R�h�,/>�����h�x���:��������u�u��y���μ�V�^�� ��J�k)Hi-@�wa�Jۛ�M/H*����Ԓ����G��;�%�����M/�KjNo�vօ
\�p��9q^V��%�8E)��D|�>f��+�@�
��$fL��g���5����%Z_�{$m��98�jd6wܧcJ}kp��R.�7`���U����;7�y\�z��yY<ݏ��� �V~�m���>��?����J��;��Z�y��Ѱi�+�����9͈��۫���k�zo�w��me��F����'��������}q��'r���{>)Ö֨f[��4��ʝ��;�8لn�������W3%�d�MV�cQ'q���}�Q���-)�%Ǻ69'�[�y��.�粭]���x��pᗲ/i�[��h�\n��Q:T�K�:k�v2����[-��w������t��H��	S_����� ��MY|+�I���6m-\��qCԱ<,�l�g�n�(z��u�:B��kd�8ŪMc��+�i�P�hGp��X�2nԊH���E3^3�`�N9�����c����t��e��^���J�-���E�y��)������l1@dy� �u�ݳ�g�=������U��/�����ݽ��y��4����_6������?����[90      8   �  x�-�A�$!�us��.���H*-��C.�#�/���^-b�^v�m_|�m1:.;��/f�'�߈�4;���iӝiӝt#�f��6�y>3;f�t'�M�#�M7æ�æ��Φّi��e��m�Mu�ivd�t��tW��.uW��Xæ��Mw�Mw���f��6�u>3;V�t���iv�n��a��æ����;m�[]Έٱ�M�0�;���M�¦[æ[���쨴�ֲ�ֶ�{v�t�l�u?���t���~��aӽӦ{Ӧ{�e�C�n��U���[6�{?k��m�]]��v���[���J�z+�&wX��m�[o���V0wX�F�u�a�;k�;����5��.��[wG]�H�Fٺ;��۵��U�l߮�֮�~gk�����U�����~����_k�?���      ;   �  x��U�r�0<+_�p2X`��$���턴��"��Ȓ+۴��o�u%H��bv����[	1b�7bS��zG��&�OԐm+|2�qG^�����8�{��<b��]KSe|"���2>׶�HQ�8⯙��}�_Ș�%i������4--g�N����h�ѡ��L��=�Vی�t�:�?�J�4�R�=8 �=�+�+Tp(qo�Z�xHw; ��]�U�\�-�Ԝ�+�iVV��K��Ju�t�"e�]�yJӇ�ق��ԍr�o�O�Z��P�>Q�.٢�~k 䝑�_�{s��#�ظ���|)�-ARκJ����/��4�=1�)�I�?yWv������j��&�����Ǯ�i7�g%������6R%�=wkh'�4
f9��כ�7� �?�n%fws�"�6�"�����z�f3���=�t�F��ܹ[���Պ��d�/b������=%�s>�������N7���M���Z-�C���j�����G�sq�͐6X��/����$�͐K�,�_;�Ք��E�)]'�X���Rm����{O�Η�;�o��l��B7��8פV�����ڸ׉��M����Z� �&��ErQD��y*]�D#��u�\�F�"��X;:`�y�$p�	���l�kj[�4�1�a���qD��\Z�a!7��ƽ���X��e=�k�p)�!��F&Q����;,Q�VQ�U">�

�
��p����/�*�!�(0ˮ
Wc���׋����3���      =      x��\is�ȶ����~�U��"&&J�w�wǋ 
- F��_�NI����͸���И�&�u*OfUaLi�3B#�Mka01I�GX+N��F�=��Q��#�P����y������W�i9)�^ZM���e��l�ϖ�j>�lV�a�#��]�yv8���0So5�)�z\Ȟ��C=�/LY��-��v�yY�lo
X��ho�/����2�����g�����O��"����l���^b�e�I֣�o�b��2Q�h(C�55	A<�*
� #BL��ӈ}e�������Y�p���t�[�~��OVp?Y������,�;�独��A>��l�s���Y����2�������Q��w�S�{!3ɖw���+��/x�./+{{S�䘝�(O���Ł���	S�-�ı�RjB5�&�Hj �� fa��}e�7/g�u�y�(G��Nj�H����Ã�XNx���JYƐ$��)Q6U��#�ڻ��uǬh��9�-̾}�v}�D������^�O�ѫx9�����Am�����8Q��(Fq�5!PDD$H�� C��yW�-7ĮK_/�b:8~x���9���,��F�9%�wܩ������/���,&	�~�o'g���Y�gc�.y���o������ib�)ZH�B��qD�C���Q������4��OW��Ծ.��G��,ԓl�tr�:9�5�-�Ǉ7G��;'g������r��Bl�6R܋$&1��jft�DhIf0�4u ����jTu5��e�U�j��V˼���0�z��.��L���˿�܌�	�ꑒ�Ν:�/�=0S�D��,�٤߷�����H��-����(Ƒ�Z3
��ccb����0D\r�?���g���m�H������j�Ԥ'O��:����o��T-q��}��٧������zdO��Cc���>1�����WE��F�I�5���O]��0d�WA�����$���!<�pg�]x�*��jpkU�T/`:�]3���-5_�'�lq��շ�Z�,��;Z�h�}-7@�A�=*Q@�TI�#(�L��q�����%6����O�/x (
E	RXp�����L"$��|�$��ک��!oQ�8`���\_ҕ|]����Ip���tP[buO�P3���h�	��D5�dp(�T�_��FL�q5����5(FC���W;�{�Ì���@����t�c�3	{�Tt��|�3BJ�6Ӭ��_�����M��e}�0�P���˧n���0�p�H��Џ�Yq���P$� �	��� ˯�L�!x�պ�l�W��2���do���Q�'ġ�+�G	�u�u2�s`[�돼��z,��_���������c��I�Am�=�8B��H���(D��1F1�m}��L�L��Y�)x�Y�t3�EAӜ�,�3�I2��hx���k���t�v!a爷����^������ᣜ�%�����������
!�i#QȈ�H����s�LP)p(qȿ�rjiUۙ�e[c/A>&�Y>�*]W^�����%���w9)!�y�{6)X��2H���#z�v}	[R0=҃�K��|~vr�x|�{a>U�jK4�2���S���J� ��Hi�e!�G�������}5��b�`!�2Fd.�pNQ�X�u������.G��vl爷��'�ޘq�.n��|���O�X��U�bA<�!�Dq�K�	�(���/���yZ��^������y�Y�%�/�\)߅Ps�SJ5<t����j�8��@����;m�uV�w-l��E�����`1�v�r�������臣O��6Tsܓ�k**C�d�0�`��
���� �k�-�PΪ����]�Y���87�c9�JF�i�>� ��Ni :K˻��s�[*7�O�Cqry o�N���K�~褗|�^��Z�-�n�1�h$�BLIE$׉�&x�U�OD4����\a��YV�Fp�|�W-F�^z�N���\�.�UmÏkE��<"��w{�^�/O/߸��*1^��s�z|��\��jK.�(
v��ƊP�,�%�{��(f 9���]���T�|��{Ű\���eڠv����e$�:���F«�:_�g�P��pQe�j�a�@7a�Y���!п����xi:��Q����A�i� ַ̻���1���~4����>�/�����j;���M�d�Ga�`�d0�!�@�"�¯[_�\�H���tQ�T��Z2��j����08��[h�)4;B�Y�Cp����]����mҿ돃����:�Z�}����B�[��(螈"�� f2I�xMBF\q�J0ѿ�h�+�|�|���x.X6�|�9J��Q�i���]�Ԫ'�
h�Ĵ���+������㛗Ǉ�$�����_9�^O�>�*1�@mx��(�E�h�a'";��$��T��"�z��4e�C����z���Η��-�?k�}�c��+��j�
�g�/��L���xq�X�J�o�J�3�{�~��r��r���Ѥ\.�t�Ę�A~�ٲ�X�z7=&�;LV��W����7��|�$��D�  ]�UE׍wNЖ�q���������0�S��`�0��ǀ�T���#$�$�Ep�5�,@iu��"�P����5�C/~�A��v����izt�U����]�r�uI�/�A�U% Y/
��F	M$8r�V�cJX�B�et�n�H��5� ��
��{�,T��?/S�Y��|�C������Mrь*���nK.J��(󠜠�<����W�v�	��g��u��|�<1d	�]*�a�L���"	��*�v4V��(�q���DJ�擼v�
W�`�S�>��s���r��g�-��As���*'�i5,'� #�*Q@�Y�XΆT�b(U)�9C(m�O
�� �K�����JbmB0��B�6!��� �^=#D��%W�zϹ;�\;ܔ�����·���7���g�������\f��a���"�\ءm��gz�"�`�r�+��5�)aC��Z!8ZEPC�i6P(%��uÔSDH��@F
�c6<QHj���áK�8�����yf��ll�-��Gʟ�Y�Bi�q�*P��z��`Y,	;����������`}�4|V�,}~?��臕o��7���7P�8CmbI(�8����/����i�V���t�;3���f��S�>6��21������1��1�%�Z�$��<����[<�4��5��|},س�y��޸�	�LF!�$�H�!s�u�t"��N���b���(�A.�����HS!y&���c�L�K��e'-&f�lX�:��o[j5Yv5}NW�zz'#����ן���ҞD*`	��=%�O&B�6J�1�����,����%v #o�?J��Կ�.�o����-� ��|��Z�����n�.�nX�Ί3�c���k�m�v��ol�����������`J֯����W�Ԗe�K3���p;J�P�R�B��$�%��K;.�x��KS�P�b�pV��2��0�32dJY��*Hl�F#��]���=�]�ݒp���~�I���GOG���Am)�=H�Zs*U�AR8JL�C�!#�$c��H�理���vZ-�� �ja�*��nei�D:�F�=H�1LbO��C�a1H�����Zr���O"�Ãz���B���K�v�(aY|�<�Wg��<?Ml~5�8��)
}����a�D�΄���qЮ�Hc��9���*r�|L����r8t;)(�$*
��Tr�[�t�H0�2����s�[���������\���������6�*�03e�4���?B1�)��C��@ ���-�!�hF1Ĉ�ZQ�9M��
l%H��Ǹ��F�vŪ6�o�`�؇����q���|rǋ3o�t����Am)���c&i��p���H2b@��FH��۬Ѫ���z,mD	L}��P�DL�k��M�â��:�(�,���J���ӧ�U���$��r����I��O+�h��z&�A�@(��~��;�" P
  &c�
_�5N~!u�̾���gh���:_�?�
ArD�\�6�l� �L���3�]���x~[߁�����t@["�[�N�=Lb�DḠ
���,����W��j���|Ϯ�!��^���^���ղ��)�(�A�=<���`9�S;��=E1p��b�O��=�A���V7i�HW�rP���8��= ^.�e5k�1�u�������������z4�Å��]������|4���#�!���QĂ�ơ��% .Nt��?T$�/TOW�pN��;*�.�Q>��rdO���0d�e�V�������^����7'cv�o4#��O�p��(�~Q�-cy�S���!T�SF2N��0	��� s	OI0��z��r:���l��"���������6��Ae�=��p]V��U>��j�/�`2}{#��t8�_JU�z��v~E��ͧ�|�_�v?,Jq��|}*1Ԗw�3��g�"�D�
B��*�� ��_�����u�V��*0��ʭB7�me{ �.��?�I݂[������K���"zJJ�:כ�5�ƿ��+;ds��p�Noじ����M�C�e��L���Hs�Ix*p��P��0e0E���j{
9d����2m�2u�c���m���:Z���m$`PԎ׮=�q#���j�\~��sP��_���Iz|7.����d�>�0Fܖ[�3�N��a��X%R��JFa�0���HD�o%�'ɟ�O��S�����֓�B��F6G�wm[\�z�OO�ct�f������'�[�-�ע 2T�R�u��Kd�!U�?�ԃ���-	p��;����۳�s�bۯWf!�9�0q��j��$n��@�Aǯ�umh�5�-��$�4��"8{8��ߤ?sz��j7PqO2K��D$�AG����ϝ�CQ�����Zh�t!m���A�c��п:���燋�Ζ�}���r�?��y�8k��{s�ɭ��V��\������r���M�v�o����z���_euu���^�/�Ϸ�i|�yc렶��#���!�"��YD�}H�B�dRb@���,��W,�|^>���6>�z��^5=�n6T[2=�tkwH �Ny��m�q�l �k�D�殮�y��6�<��y�d�4objf�8\����9��e��(#:!����A܂0�k�4!�	B�A����m��n9|}�8`�>�YE��3��!�t�y�|��n���v͟�ˮ���}8'�/Im_n��p�6zD��x�i뀶���4�x�I�8��1�X���@�0��ѳ�׮
S����5J�/�<���T�ipG1�qOC����ڜ�5�-mpu�ާ��n����<�I������r�%U���fp@��`&�'�Id4@0,�DF�}�q�?�=�El_���i�̫����Wֵgk��!s[O�m�0���T���Q��ow=n��e���۔`�����)�����;�|�S�������A� ��N�:�!5!�w�AA��S0�S��'�K�7���^�C*s�b�9��N���Ys�eX���|B��ƕgg�.Y5 $��a�]��-�����$v}�[$�q3�AO�}<�~��?��~ȫ���N��&"L�(
`��XcC�� ,\�?]���'�W9< ��R�a��B*����)�]�gZ�G$\�RF�1�7+��F�EU����S:x���}!�6�}���a��'�-����}��;����r�D�1�(�NM��~H�e��E�m{I��w$���ɛ�����;�]��1�F-�y6�T����ÃL���y���H[�-� !\"��C�ha����R	F�T(��l�t�M��"�/�>�O��o彑���7��ίN�4���񕏕?�~��_� ��pd'�llI�[�P3�{BKL7�w}q���7Bm��ϏGk��t�ϊ����|���jK��%���k��HW�)&�:�Q�8��O�:��ZV�E�����v��v*mk�qk��=qؾ�=Չ�[ش��[�^Q��W�����Hs'�tO�?��ϰ��>5�������gPg�0� ��;�a�`��(����eu&n���a�\W�?9C����=������T�������OBY,���d���;BO������I��
�e��9�Ec�N�Uaa�yV�ܨM�Ѫ�.�P�N=B��t��t��n��?B:�7�����-m�����`�0������_�柟P|�^�@�Y!�b��G+��X�*Q��L��#������OS?s'�h�q[P�C-R-
�Q&�4g4�j�~�p���w�vs�`���t���f�٪��n�<?~.�ԖRp$q�4<�R��$qmґ��)(�P"\��_�O��4�l�W�`ć4�4S�g"UY6��
��A����dy^��0���nM��>U����n?�l~��/`�1�i1ƫ�ۛ89Y-�'��/~I��Y���B���Q��&.�Za�8.�(�
�Ws8�{����nkj��G���#
�1\���m�S�ڹo\�旔���./O��d�Ńe|3{��}�>r����
�������׿����p�[     