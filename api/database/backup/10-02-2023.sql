PGDMP     6    (        
        {            Overnews    14.4    14.4 1    3           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            4           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            5           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            6           1262    16723    Overnews    DATABASE     j   CREATE DATABASE "Overnews" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE "Overnews";
                postgres    false                        3079    16724    fuzzystrmatch 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;
    DROP EXTENSION fuzzystrmatch;
                   false            7           0    0    EXTENSION fuzzystrmatch    COMMENT     ]   COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';
                        false    2            �            1259    16735    ARTG_CATEGORY    TABLE     �  CREATE TABLE public."ARTG_CATEGORY" (
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
       public         heap    postgres    false            �            1259    16744    ARTG_CATEGORY_ID_CATEGORY_seq    SEQUENCE     �   CREATE SEQUENCE public."ARTG_CATEGORY_ID_CATEGORY_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public."ARTG_CATEGORY_ID_CATEGORY_seq";
       public          postgres    false    210            8           0    0    ARTG_CATEGORY_ID_CATEGORY_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public."ARTG_CATEGORY_ID_CATEGORY_seq" OWNED BY public."ARTG_CATEGORY"."ID_CATEGORY";
          public          postgres    false    211            �            1259    16745    ARTICLE    TABLE     �  CREATE TABLE public."ARTICLE" (
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
       public         heap    postgres    false            �            1259    16752    ARTICLE_FILE    TABLE     �   CREATE TABLE public."ARTICLE_FILE" (
    "ID_ARTICLE_FILE" integer NOT NULL,
    "ID_FILE" integer NOT NULL,
    "ID_ARTICLE" integer NOT NULL
);
 "   DROP TABLE public."ARTICLE_FILE";
       public         heap    postgres    false            �            1259    16755     ARTICLE_FILE_ID_ARTICLE_FILE_seq    SEQUENCE     �   CREATE SEQUENCE public."ARTICLE_FILE_ID_ARTICLE_FILE_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public."ARTICLE_FILE_ID_ARTICLE_FILE_seq";
       public          postgres    false    213            9           0    0     ARTICLE_FILE_ID_ARTICLE_FILE_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public."ARTICLE_FILE_ID_ARTICLE_FILE_seq" OWNED BY public."ARTICLE_FILE"."ID_ARTICLE_FILE";
          public          postgres    false    214            �            1259    16756    ARTICLE_ID_ARTICLE_seq    SEQUENCE     �   CREATE SEQUENCE public."ARTICLE_ID_ARTICLE_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."ARTICLE_ID_ARTICLE_seq";
       public          postgres    false    212            :           0    0    ARTICLE_ID_ARTICLE_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."ARTICLE_ID_ARTICLE_seq" OWNED BY public."ARTICLE"."ID_ARTICLE";
          public          postgres    false    215            �            1259    16757    ARTICLE_KEYWORD    TABLE     �   CREATE TABLE public."ARTICLE_KEYWORD" (
    "ID_ARTICLE_KEYWORD" integer NOT NULL,
    "ID_ARTICLE" integer NOT NULL,
    "CONTENT" text NOT NULL,
    "CREATED" date DEFAULT CURRENT_DATE NOT NULL,
    "UPDATED" date DEFAULT CURRENT_DATE NOT NULL
);
 %   DROP TABLE public."ARTICLE_KEYWORD";
       public         heap    postgres    false            �            1259    16764 &   ARTICLE_KEYWORD_ID_ARTICLE_KEYWORD_seq    SEQUENCE     �   CREATE SEQUENCE public."ARTICLE_KEYWORD_ID_ARTICLE_KEYWORD_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public."ARTICLE_KEYWORD_ID_ARTICLE_KEYWORD_seq";
       public          postgres    false    216            ;           0    0 &   ARTICLE_KEYWORD_ID_ARTICLE_KEYWORD_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public."ARTICLE_KEYWORD_ID_ARTICLE_KEYWORD_seq" OWNED BY public."ARTICLE_KEYWORD"."ID_ARTICLE_KEYWORD";
          public          postgres    false    217            �            1259    16765    FILE    TABLE     �  CREATE TABLE public."FILE" (
    "ID_FILE" integer NOT NULL,
    "FILENAME" character varying(200) NOT NULL,
    "MIMETYPE" character varying(30) NOT NULL,
    "CREATED" date DEFAULT CURRENT_DATE NOT NULL,
    "UPDATED" date DEFAULT CURRENT_DATE NOT NULL,
    "ORIGIN_URL" character varying(400) NOT NULL,
    "WIDTH" integer,
    "HEIGHT" integer,
    "COLOR" character varying(100)
);
    DROP TABLE public."FILE";
       public         heap    postgres    false            �            1259    16772    ASSETS_ID_FILE_seq    SEQUENCE     �   CREATE SEQUENCE public."ASSETS_ID_FILE_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."ASSETS_ID_FILE_seq";
       public          postgres    false    218            <           0    0    ASSETS_ID_FILE_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."ASSETS_ID_FILE_seq" OWNED BY public."FILE"."ID_FILE";
          public          postgres    false    219                       2604    16773    ARTG_CATEGORY ID_CATEGORY    DEFAULT     �   ALTER TABLE ONLY public."ARTG_CATEGORY" ALTER COLUMN "ID_CATEGORY" SET DEFAULT nextval('public."ARTG_CATEGORY_ID_CATEGORY_seq"'::regclass);
 L   ALTER TABLE public."ARTG_CATEGORY" ALTER COLUMN "ID_CATEGORY" DROP DEFAULT;
       public          postgres    false    211    210            �           2604    16774    ARTICLE ID_ARTICLE    DEFAULT     ~   ALTER TABLE ONLY public."ARTICLE" ALTER COLUMN "ID_ARTICLE" SET DEFAULT nextval('public."ARTICLE_ID_ARTICLE_seq"'::regclass);
 E   ALTER TABLE public."ARTICLE" ALTER COLUMN "ID_ARTICLE" DROP DEFAULT;
       public          postgres    false    215    212            �           2604    16775    ARTICLE_FILE ID_ARTICLE_FILE    DEFAULT     �   ALTER TABLE ONLY public."ARTICLE_FILE" ALTER COLUMN "ID_ARTICLE_FILE" SET DEFAULT nextval('public."ARTICLE_FILE_ID_ARTICLE_FILE_seq"'::regclass);
 O   ALTER TABLE public."ARTICLE_FILE" ALTER COLUMN "ID_ARTICLE_FILE" DROP DEFAULT;
       public          postgres    false    214    213            �           2604    16776 "   ARTICLE_KEYWORD ID_ARTICLE_KEYWORD    DEFAULT     �   ALTER TABLE ONLY public."ARTICLE_KEYWORD" ALTER COLUMN "ID_ARTICLE_KEYWORD" SET DEFAULT nextval('public."ARTICLE_KEYWORD_ID_ARTICLE_KEYWORD_seq"'::regclass);
 U   ALTER TABLE public."ARTICLE_KEYWORD" ALTER COLUMN "ID_ARTICLE_KEYWORD" DROP DEFAULT;
       public          postgres    false    217    216            �           2604    16777    FILE ID_FILE    DEFAULT     t   ALTER TABLE ONLY public."FILE" ALTER COLUMN "ID_FILE" SET DEFAULT nextval('public."ASSETS_ID_FILE_seq"'::regclass);
 ?   ALTER TABLE public."FILE" ALTER COLUMN "ID_FILE" DROP DEFAULT;
       public          postgres    false    219    218            '          0    16735    ARTG_CATEGORY 
   TABLE DATA           �   COPY public."ARTG_CATEGORY" ("ID_CATEGORY", "CONTENT", "CREATED", "UPDATED", "GPT_ID", "API_ID", "QTD_SYNC", "QTD_MATCHED") FROM stdin;
    public          postgres    false    210   (=       )          0    16745    ARTICLE 
   TABLE DATA           �   COPY public."ARTICLE" ("ID_ARTICLE", "ID_CATEGORY", "TITLE", "CONTENT", "PAGE_PATH", "CREATED", "UPDATED", "GPT_ID", "IMAGE_TAG") FROM stdin;
    public          postgres    false    212   �C       *          0    16752    ARTICLE_FILE 
   TABLE DATA           T   COPY public."ARTICLE_FILE" ("ID_ARTICLE_FILE", "ID_FILE", "ID_ARTICLE") FROM stdin;
    public          postgres    false    213   *       -          0    16757    ARTICLE_KEYWORD 
   TABLE DATA           p   COPY public."ARTICLE_KEYWORD" ("ID_ARTICLE_KEYWORD", "ID_ARTICLE", "CONTENT", "CREATED", "UPDATED") FROM stdin;
    public          postgres    false    216   �       /          0    16765    FILE 
   TABLE DATA           �   COPY public."FILE" ("ID_FILE", "FILENAME", "MIMETYPE", "CREATED", "UPDATED", "ORIGIN_URL", "WIDTH", "HEIGHT", "COLOR") FROM stdin;
    public          postgres    false    218   S�       =           0    0    ARTG_CATEGORY_ID_CATEGORY_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public."ARTG_CATEGORY_ID_CATEGORY_seq"', 134, true);
          public          postgres    false    211            >           0    0     ARTICLE_FILE_ID_ARTICLE_FILE_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."ARTICLE_FILE_ID_ARTICLE_FILE_seq"', 47, true);
          public          postgres    false    214            ?           0    0    ARTICLE_ID_ARTICLE_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."ARTICLE_ID_ARTICLE_seq"', 184, true);
          public          postgres    false    215            @           0    0 &   ARTICLE_KEYWORD_ID_ARTICLE_KEYWORD_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public."ARTICLE_KEYWORD_ID_ARTICLE_KEYWORD_seq"', 200, true);
          public          postgres    false    217            A           0    0    ASSETS_ID_FILE_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."ASSETS_ID_FILE_seq"', 54, true);
          public          postgres    false    219            �           2606    16799 !   ARTG_CATEGORY ARTG_CATEGORY_pkey1 
   CONSTRAINT     n   ALTER TABLE ONLY public."ARTG_CATEGORY"
    ADD CONSTRAINT "ARTG_CATEGORY_pkey1" PRIMARY KEY ("ID_CATEGORY");
 O   ALTER TABLE ONLY public."ARTG_CATEGORY" DROP CONSTRAINT "ARTG_CATEGORY_pkey1";
       public            postgres    false    210            �           2606    16801    ARTICLE_FILE ARTICLE_FILE_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public."ARTICLE_FILE"
    ADD CONSTRAINT "ARTICLE_FILE_pkey" PRIMARY KEY ("ID_ARTICLE_FILE");
 L   ALTER TABLE ONLY public."ARTICLE_FILE" DROP CONSTRAINT "ARTICLE_FILE_pkey";
       public            postgres    false    213            �           2606    16803 $   ARTICLE_KEYWORD ARTICLE_KEYWORD_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public."ARTICLE_KEYWORD"
    ADD CONSTRAINT "ARTICLE_KEYWORD_pkey" PRIMARY KEY ("ID_ARTICLE_KEYWORD");
 R   ALTER TABLE ONLY public."ARTICLE_KEYWORD" DROP CONSTRAINT "ARTICLE_KEYWORD_pkey";
       public            postgres    false    216            �           2606    16805    ARTICLE ARTICLE_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."ARTICLE"
    ADD CONSTRAINT "ARTICLE_pkey" PRIMARY KEY ("ID_ARTICLE");
 B   ALTER TABLE ONLY public."ARTICLE" DROP CONSTRAINT "ARTICLE_pkey";
       public            postgres    false    212            �           2606    16807    FILE ASSETS_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."FILE"
    ADD CONSTRAINT "ASSETS_pkey" PRIMARY KEY ("ID_FILE");
 >   ALTER TABLE ONLY public."FILE" DROP CONSTRAINT "ASSETS_pkey";
       public            postgres    false    218            �           1259    16808    fki_ARTG_FILE_ID_FILE_FK    INDEX     Z   CREATE INDEX "fki_ARTG_FILE_ID_FILE_FK" ON public."ARTICLE_FILE" USING btree ("ID_FILE");
 .   DROP INDEX public."fki_ARTG_FILE_ID_FILE_FK";
       public            postgres    false    213            �           1259    16809    fki_ARTG_ID_CATEGORY_FK    INDEX     X   CREATE INDEX "fki_ARTG_ID_CATEGORY_FK" ON public."ARTICLE" USING btree ("ID_CATEGORY");
 -   DROP INDEX public."fki_ARTG_ID_CATEGORY_FK";
       public            postgres    false    212            �           1259    16810    fki_ATG_FILE_ID_ARTICLE    INDEX     \   CREATE INDEX "fki_ATG_FILE_ID_ARTICLE" ON public."ARTICLE_FILE" USING btree ("ID_ARTICLE");
 -   DROP INDEX public."fki_ATG_FILE_ID_ARTICLE";
       public            postgres    false    213            �           1259    16811    fki_a    INDEX     K   CREATE INDEX fki_a ON public."ARTICLE_KEYWORD" USING btree ("ID_ARTICLE");
    DROP INDEX public.fki_a;
       public            postgres    false    216            �           2606    16812 !   ARTICLE_FILE ARTG_FILE_ID_ARTICLE    FK CONSTRAINT     �   ALTER TABLE ONLY public."ARTICLE_FILE"
    ADD CONSTRAINT "ARTG_FILE_ID_ARTICLE" FOREIGN KEY ("ID_ARTICLE") REFERENCES public."ARTICLE"("ID_ARTICLE");
 O   ALTER TABLE ONLY public."ARTICLE_FILE" DROP CONSTRAINT "ARTG_FILE_ID_ARTICLE";
       public          postgres    false    212    3213    213            �           2606    16817 !   ARTICLE_FILE ARTG_FILE_ID_FILE_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public."ARTICLE_FILE"
    ADD CONSTRAINT "ARTG_FILE_ID_FILE_FK" FOREIGN KEY ("ID_FILE") REFERENCES public."FILE"("ID_FILE");
 O   ALTER TABLE ONLY public."ARTICLE_FILE" DROP CONSTRAINT "ARTG_FILE_ID_FILE_FK";
       public          postgres    false    3223    218    213            �           2606    16822    ARTICLE ARTG_ID_CATEGORY_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public."ARTICLE"
    ADD CONSTRAINT "ARTG_ID_CATEGORY_FK" FOREIGN KEY ("ID_CATEGORY") REFERENCES public."ARTG_CATEGORY"("ID_CATEGORY");
 I   ALTER TABLE ONLY public."ARTICLE" DROP CONSTRAINT "ARTG_ID_CATEGORY_FK";
       public          postgres    false    3211    210    212            �           2606    16827 *   ARTICLE_KEYWORD ARTG_KEYWORD_ID_ARTICLE_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public."ARTICLE_KEYWORD"
    ADD CONSTRAINT "ARTG_KEYWORD_ID_ARTICLE_FK" FOREIGN KEY ("ID_ARTICLE") REFERENCES public."ARTICLE"("ID_ARTICLE");
 X   ALTER TABLE ONLY public."ARTICLE_KEYWORD" DROP CONSTRAINT "ARTG_KEYWORD_ID_ARTICLE_FK";
       public          postgres    false    216    3213    212            '   �  x��WIn�\'O�|��ÒMqh���7�O�l�@�@���,^4`@����.֑��\��Z�Ld"ދx���fw6o��ٻ\ލ���D�ɥb\2����q�l�x�a2ߞ���w7�g}�Ǔ���[���3��j&�3LK��˚X4BT�B����-�ϻjW�i2j�&�2��K�L�� +"�Uh&t������=�n���2��F,��;ƫ�LS.̛�Xt�eK�yg_�k�����8�3^9��*�%�f�E4JXs� S[!4g��<+���ל3��d:(��!�X$�1q�I(��a��C<_,?��4�}�)-���5:�v5�v��`|��M��gW8SU���|I�e)�V���k?C�l�����.�jBe���+��TMu5���[B�-:�k,���
����s7���������>��ڽ���h^C$���\�.�� )�H^%��g)��!�7[�T��"{&��LW^%�Y��CvJ:)�
�:��;G�k�z����R)ё4&��+k�c�'-�4���Q�םE ,�Y������d�+,�ЩK���<)[?1����1M����b>-*��[8i������Q��%���Ak��
[�5�D��d������U0S"��d%1k�-2eg��ʮj�i�����������0������*|K���Y_)�ܔ���L�v<�SD�*f9@5���W�Um࡬cH�����f{��\����W�NEX.vo�{~w4>}��>}�������=��pMt-���I� ��<r�W�f���&h1��g��hr�T�8��M7{e:�� m���3���ꡨAH�#�I2�*�C�f�&��.Ւp2}D�W-���,WnsF�+��eh�ڧ�Ft�p�84-�3��!�J��Ԓ4_���~;��l2����X{��x���prvwzxs�pī�'ϻ�����|��I���:����#z��a���N!o��Eėo��:�=��lw�vq������xh"�D��:~��p��fI2�mN��͗�y�1:�an��,��t����"e�&��p�����7���%�dt��s�b�����)R(]z�ts����p��qj�;z�<��ݜ���ӻ�d�M���j~q�D2�$�UQ�!����pE��ǚ�����O��t2F{]g�W	��|>��pt�����b������ϣ&g%�A�,�k�IzF�#��
u�����I,O�y�G�I����$a����s�aYJU����ٛ�'�)�5QI�}�e

	�%�YV	�p99���K�p��d:�(H��F⋡"���*���^� �č^�Xa���Ɠ�d�n�����qaY�h �[�Z�Fd�T�
Q��y�h���_��(\Q�k¢&��Ƒ���A��"����77-�x�v~"*[�0�����ÖŘ�I�0>�~��dsI�?�l�έ�P��!ě֑Fa_���Q�b�ǌm'��.�K%g#X]d�㕋y�2�4>�^H�����_RKf�ד��7{>yx���<�4�=ه��%bQ��=�*L��m6(�\�B�fg1DE�.���7EV�b�đ���N�ա����y�1����w���ZWe�aj�{F�8��#�Q4*
\�ת��@շ���f�0��P�%��FV=�db���_�����'!��      )      x��}K�G���W�t�2|H�K�,EJ|��V,<3<����G�T�z��=�uNj�'M_t�ҿd�33Dd�;M�X̌����g�=�杻G��8��i�ҙ��銇������_{�����Zӹ�8�S��_��V\���rc[Wۦ�Ca��P�bk��<��?��ř-L��n��+���/~V�s���v==�1ŹoMQڢJ����'�<g�K���9������ԃ�}WԾw[�s^t�)�C����[�������PlLOC��g�|q�蕿�nI/���լXؚ_Ӛ��ڶs�����Yx��`���x���`��U)m���kӚ����G�kv�Zg����ۚ�Y��+v�5���h�14�f����?�byn�TGB��؋�֫����C:�Y����xy����z�-��������e3��)���/e�wk�x�k����ֺ��q:��PkZ_z�j���L2����7�w���hD���2���X�{zo�U���X>��5X�����Ṵ���q3��_�?����q���n��Ɣ~IYb{[��uYB����*hb+KRCA22t�-=aXzm�ۭ���]�}�x�MO��-���T�s�#3摐���Z�Q,���ʌF�&����K�4�C��$iΦ8�q��rK�;O���J�����
��CKS]�v�ڎζ[���li!�˴4ml��j�KMrM��6� ��c�8�A���T�iCkG�KJ�@���YL�Z+K2A��[��z���9�{�ӏ��8nf1�#3�Q>�D��9��� UDk�����*l�H=-��O�*'�����p(�C_A�{�(����S��X���	�~4]ȟ�8${����dxK���V<}2Z���o{V�K+G�����k���h��<��Y.h(�d���~�1�V2S�K菡ܽ�\�g��W��ن�#IN!Ngm[�����8ZC|Ke��Hg�XJ�Z�ZKk)���c�zh(R~�g�Tl
L�7��b�,i���\f�Ҷ�[9��y��e"Kb|A/��+���f���v��(��f�������Ө�8!��5ڽ�tt�{�񳒬v�Y�M�y�N����|�mh?!c
�a�nVq�(��:eP̼:M@��3����O��׶ ����觊5�S�s34t�jڞ���tDX,ҸK�:�pm��Ls���Cs{�yn����nݸu{~�������e���wV?=}xzY�z�����l��o�_~��}�����?=���;��7�/H����L5+x�'����=F/E��n�|��dl3�e?�Lm�4#�1#g���ѴM�K�� H6-��}ӻV���@����c)w�I�����O��8�e !��Y�l�VVc�ICJFť&�����FȆ�~j����-N�Й�W�ѥ�s߱t��Ȭ9t���Ԓmlɼ-H&��u�K6�� i�sq`̼��[E�7S�F(��J�5���Xc��d�
R�$���Y�����/۶��)�ᓠ6�>S;W�b����l�L�]��0�Q��%����f뫭�"j�
C��&�sɐ��Z91%��HXE/���c�lؘ��1���Z��4�#}�>��w��/�P���K��@�6Z��@o�[iH�����LAcC	A-)����������-��&_7�_����]E"�ଢ �'^'���D\fț�)ֶ:g�
��Sd�G+�2�W�97��Vl8$��<;�Xfg$�ur	��5|~�[7d;��>,���J!1�Y�I-:�ݿC�����*ʧ" �x������a�nΚ���F!��Gex�X½��mp��w��rX�WU[��7�5�;�+�^�}۴����� R�]?��<u�iE���l�ߩ��F�k9\9 ��ъ��m�1���o��{Z���1V��Ym!��u�1�����;��J?]�b݈͋�3_��������Y�f.� ��PD��Me{9���h�`��^��Y�I�W��=@��_:zhXQ��iL#DX:	>Ƚ۰�> �|����H���_��m�ڑy�o�[2�:=���}ZY�&�L�p�#�g�%�"��yNҹ���/�����L4��O�݁������`ͣ���	�,�|�c@�����/�<���p��[��uwϾ�`��� ���H�����HnHΞb��0X��ɡV�K;�6���0�uUQeʄlGa�- �����t��@7���9��{��йqc�%8��Ւ�ǧ`,9~�BH���s��������/�r�򊉑c�@xVޑ$�^���b}MX ���/��"Yyr�YI�/���/�c7.�>��XV�1:ŪFx�ɂ/�
�&�N���Q��h�D���K:��:_=��Ғl���@"��C需��&>�L{�K��40���,�Պ3���1$���j��	�qM'�`�?�o�Ɩ���FAH�5t/;�����D<��ߕg�������3E��B'{�����#��:u����i>�`QX]f�϶%��bl�:5T�n�sB�U��V譵8�dg�i9Ca�3�-��a�t*�d���3,�t���j��ZAs"�FbH Y~\|�ZT@~�x�3�'Jg� �F� 8��pdt筐��'D�/��5����z�T��<Du_2��7H"lg\J�n�y��v]����[jq�rGKI��,���!��J�A5��.f�2`k�!S-�+,���2�����&e�1Ngw�l>-(�<���@2�aa�?�a�Y�Xfft�{%��B��e�C)�&���������60��n�8f�4W��섌��zJ���k1�����b�^�~d�O�oH{ŖA��񊋞������7��s3���9��"7������?k��w���yv����w�7������b�o��E�N|{�}��P8F���B'�(?�n͋|�V�ۖāl������ߔH�����ǉNL<��^5�g��zV��T���=\X���W��9��ݻy���,�QOvᜎ�-� t/���;�{e@����Jua�����s�0m`� ����������0���֙��j(h��V���FӑHH
���ơ�} �QT�u���I�}�Krb~&�u\<ٽ�̼Ӑ���`�bhJXsw����pxv.}&���̀��s(�,�Ә���#Ns�or@j���2m��%"�$����)q��eR��S�I�K&��3lt��+ԇ���]*R9�_)��ѐ�T⬯�����f��&{A?|����[Æ�A�Ew!bU��ł#/�W�J�~ϋ%�'I;�.�m�G˷@�� h�F ���;N�_�ϊXp��o� �fm��8�8�v|�:���3��Z�Ї�4��J�g��h ���X0��	���4l��7{y��z2�6� b�W�&#>YBF��?��}�Pg�3(ܧ�"���)+����c8&�{�:��%$���B�{w ��4
l����U]�@$��TL=C��b|& ��P�fjo�壵�c���� ����W�� �����!��0���B��N1��@�.mFq6�="�!�o�����y�W�.7�6!z���c�*&EL�5!R�)VN�5�G�l�Y�NY�Q#^F��^��$�*&f;z�R�k�b���,}Sx˄?��A�@[|�h��Ƨk���᙮�=�t���u����acZ�A5��nN��������s���!A=r�ڥ2���H��(p����#%D�0��������y0��L���ܼ�[���볯<���ۍy��ݵ`�[�Bґ�R^�uJd��=�`��߽��l�7 !k�N<��J6m�sA�֜�q�O�j5�V1l_�9F���,�"K2Б�V� #D��0>�ZH	^e�������#o�\�Da���� �I��߃Q\�}ЈGhr�g;Z��G٤�M���%3�),<]���_	Ӕ������yLt\�[~����^Gg�+~�-��/��+WOV)�ﰼ ��¬������)S�S    �a��*kD�q׬�v�t�_<��ʺ��ؙ�s��'B_=�ad�?�Ȕ�~�(����o�&�!��`o7���i]���gyI�@�uX'����S��o�0Q@X��N�9l�$VO��7>*+Pi��v?P;Y��3��Z�3���[���q�9U��W���������a@�܎���%K��[�%v*)t���+�l���b�����r�I,���� _E�P�ҋd�\	���9D��7�&t#wnF�yL���m�c�h93bo��\�If1#O�6|�=
nd�xj���Z(1��"��f�/�e06�.2!N+�n�5��P" U�OU�Uűa�G*{���C�|�s�@���|�F�"C���Ce���'
����R�K����`�i�`E��c�s]ʹ�I�����#�ţ��˪y����[?}��s����O��߆Ň��Z����a��_:x�E�s_@N��8J�
'��k��C_�y���1	����HJ����4��͵�D�+N|(%
� ^ye	�3c�!�^��l�Js)Q8�C#)g���,&�8�'a�pGm���^ȵ���1��`�� �Fڧ��q]F��J��04����/����E�q{���2��T7�O	��ɴ��u���I)X��̽dD�K�nz��L�"H�C�N�=�ȋ�
��3�Ą$��P,g{N0~I��yN�L'mNr�v��2��sH\�ȃ�VO�F��@�T� �A��������ԗ����n@�
,ކ�,B3�K]Pg'4���E��%��ЂhZX��d��ۓ�fϴ��8��,��󟉄
�&�|�v�9<�^�iDV�(O��=FVbX��׬a����-�?�[!���w#�w������Vn29z�jDO����)�׻_X�i�φ���D�	י�ۗ�3��	�, �#a�fY&s��� Ώ�(��d��3h�9�K�Ғɒ�NE~i@,d�Yh{�5��v��rp=�팏�`�c3�)l!�����@طU������M�jkyn�����_;�4Vq�X�f��j͆�5��7�u�`F�5+�\�s��@���~ŅY��_���ay�<�z�.h��B@�HB�$ǔs��f�:^�\���B%RhKeh��
�� ��n����M"�M8���l���, ��{�8j�W��<9B���Lw��S-3�*@�������lX	UC�I@��Q�N�֜q���p��ڸ��o$����M�Fp��9~�v����b��|5�1�����,֜-'Ж��:����T�l��������u�������ƣ/��<>��+���ѽ�G'�7��I�k^$糞�b�{r��3�g���Q�C��R{!H�1pe�r�+:9�Rt5��	K������d����T��Dw,�k���
�"Ddx�Eo���l �"!ťd�~aӛ��l�=��cKv��_�����(�EП����~l��5}�M������*�O=�L���qZ�/%��%B�)�]�#ֆ�,u�h� uS`��n���3$�NXÖ�eVJ�r�3Z�@�3�5�4��:�|(����i���s�%�{NhOU=st�v������ͣ��(���B�����gf�`�����l!�)ǔ,�WN�!XE'ђKX���Xq@�Pѧ�X�s�/�	��!�F�皈��C*y���m���2&{����IU�4������d�qD ͂�[�DE� CY�lJz�*^>U�`�I�'��9���N�:f[G�o-SK�i�� ~ty�ת3�#���bg���{�J�(/��ta�VS�9NG����5�\'�����ť�M�J@��䩸�8y:MLד�ڕ���T�"<���j��>>�������=�T�_[7Y�Y@�rlS𸳚��Q(����\&s�̇1�M���L�a�k">rD6�TƊL���lMʚ���񏼎l_���8vF���|��w�V9Z-t�_D 7$2nf5�����rvF+;�k��n!!�X9Ѱ]�Us�CA K~�3I�=��[r�P�|�Zu�
�(��]�.	���� ĵL`�m�V&xD�"����L�&�&��1I;^!�GM����&H���u�W�P1�KμZU�l�B��z@n>&򹟤FBPB5��} �3�ܔ@^q^%do�����D�GGQ	2��ȓ�s���	'�4Yr^��e es?�$H2��|���|��9{i��������͏w��>�zvV��\��/��2D��u�@�$u( �iМc��מr�ֲ��C���N�A���Q筽�Y�� ˚�D*�$l�+,@I�i��\�:�C��U��UקU��JP���y�q��`��I�p��/� �+$��PrpO'����j���4x=6;\��j�N_�L��
�kE���Z���!��S:_<ީP*�F�k�H�)��$zF��SʂG�'�sa�U�R�������!�5&�B��J�r~t6	 ���-�@��q-m2�<��O�P�8K{3`��OH�E�Q.�f�]����j����z��g�o�W�@j�h�� 8�����m�4�؍��iiި9+9{�� 'b45b��Xj{A��U�	Rk�8l/�H�Q��Tf{@(��Z�0�OX��]e��ʑC�6K���%4y��R\�E~[��R�`�m��v��"�Xc�[�>H_�j�9H+��z�{�ӡ���]~p��>x�K��^k��RQ�2<�4)<8T6���a1�NXDd���B�qҚN��*�C������P��8&���+'��q�&}*�,]����땙0E���Q��+1[�p@��M�LҒ����P&�j�U�`	�2u�r[�!���vE �ױf��g��H���|)<S�-*�xb�v�'���gH�8�+�y�9��%�.�y@M{�5=�4��:��?�Ȓ�gt�l�c����\rq]�� ��'�L>z�L�l��T<^�-d/�c�F�f�@}o� K�HB=�P[��zR;%����'Lt����8.��`���m �Q,��d�.<pF���eH��$A�%��J>M^�200��r�z�`���6ާ�2۬�оa5����s�#�I	u`���b�s���ۏ���~~^�Y��>�Z�x������ƫ���߼Xw��9=��E�M�)���k��[����e�	����E�"�Ԁ�z�v����'���ڵ��$k�,���w�&�O
�����A�L]H��M�s�3�
	oH1�@��ޫ`�x�!;�e�J��8�t�4#��kG���v9�Nm\l�{1�����vBm�@�Vm-���+d��9k�#R7h�DC<��5g(Ī��C��^E�>L7�C�
e�1��}4:����Ĳ��xd�GB�#��W[s1_�i�!Ϫ�dX����w�5�e���5zR㎁k���)o#�́���2��9w(x��s�3���@��va��7)���e���2~���l��e"ₘ-�fkRj�İv��k�׀�˔�8B���F�� A���\�m��8�4AD�fm�l���ˍJSx��1g��=`|>0 �oІ�p����Ibg���|vn�:k#(��i�b���0��J= dy�4����(�Qh�GƷLs�����*���>��θňHV?�?�_H�|Z6Kf?R5��$.��[����{E�L��z���,K�$�E�#fPje�AO��ض�Z����L��o�(p�Lo.�才C�U�ьi�`�vl�lyK��Or�d��Baa���@G��*;��V�D�W��X�( �N'�)�&��H1y#q~�͸E�3'u���s����u����h�4 #�&t6��>��=��Ǎ���9�mBsCI��|��0�<}*��9��Cw���O��o�~���}����]K���:�X@�!�'>�䁾���1*LrAJHS�P�2��em5�4,�Fb�ՄR�N����1�҂�nW��h�'miZ�NS�^���:/Ir���I��@��,G�	�ˉ��A�͜{��X>�_#�Kt���Vâ��m�Pg���*�9�����h�Y[�S�q!I�ՇR�'���<��V    
�l���'6�#@Ꞧ�e�)�íc� �UNd߄��'�?����m 啒��̻e�������p\@'$~����v�a��<�O���399�v��+5�c�	�Z�Ky�/SYd(DȽCX�e?���j}��m�-�8�$���]��:�ti�"D�f���*"ݳ�,���4w�g�E��u�zB��%_���?0�~�J�PM�9>lG ��VI���|n�  ��
�<����"|B�ljK�� m��n����k�d�� ukK��j'~!9���:�}H	�6r����f�f>�>��8�f�>!}_�'uL��ޯ���^�$|����R,M �H�����G
<Jwq2�@T��
�A]�Z%
����k�m�22��V�`bumK��ǶU2�>f��iI*��ml�����@h�<YnDD{���<�@������Ǿ�L�ڙ�a_�J�R�1��6�P4J
�4N;����%TBF���YDCRq~��q�p2����f��5wL��_�|7O�t�@���*�����|�Z�J�Go_�~���Ǘ�]s��ɷͫ�y����L#�;�8�Y7	�|��~/��y��sU:|�h�R(���<.Q���
�S�(�Vۻ��+z�u:��xL�L�����߇T�	Abh�À�ph;��5H��'&gDMn�ɽ�-�HK�Bm�r!/��R=�@�9�@�Qz�Mk�A����қ'�S�9O<T5V�r�����0#��v���-j��saǢ�ƒ�X ���AT��'�gJGD��(�-\3qa��+D�\���-+�J0?�˷	]H�l��O"K�����0�~�.d���¬އE-��g|����7���� *C(^&�6��$�)gܮ�5x͌���C�U�����
|�մ�N��<�|����o�6��N{W�o4���'Җ��s���;�@�EU]����\�A�����5,sI=81J�	#�7y���V(!�1�	Y6��B����C���iP#4���z���7�EB���]SNb�e�GE�I��A1������kf�V��'F9�������!)9�7�kljǉ��WcR��L�?���uK��֍�s792��A��=�`��ݾQԮ��#	��r�<uR�		0��N95%���y�
ւ�v���kl�A��0��%o�a�⠑Ӟ��>㯨ҡ �r�AO�t'����உ�Rm�� i�ц��<{erR��� ��/MLD�>[z�B�-2�Yb]j��E�O�sm��Ʌ���!5��8DJ�:����X�˔�O���;�X�<�?U��L"�~s�qA��W�o�7��{�*φ[ݣ���Ms� �{G7o�?���S4���΋��Z$�k@�T�*�7���&'r�����Sjo�����H'�I�D)=jQߗ�QY��I�v	��~v���l�eԇ
����y���[z��S��\�!�P�[1�D����Ru��G�0\_�L�ѓ�gs�״������4��ۜU�趻��9Ɖu���q�Zz�\U�h�<�Q�'B�1�ĵ	�R�+t�P�%���ą8^��B"Z� v��r�n"��?1I��8�G;�pF�f���ɦh�<��v�����]���Z�hj���Zߩ��pB�t�Q(Q��YN�������2~�M+��G�0�y��;���-߲�I�-3-!hA�AC;:�KPu� �<%vl��� �S�;-V�B��։�ڴH�ai��׬�G$*t>{�(إ7�7�0tϻX��K�[TB�M�Z�.�i��7(̧���·*�K��2]����yI��>���s<�:u#��� WA�[��a��P�Xѩ������f�[�]��c�n7]o��07�g�~�]�F��������/z���a�Ղ�����-�L���A{�D0i�@ETU��U_j������xjQ
�+����	�;t�JmS-��{iF�Q�w�ei+�þ�$fCH%5�($	D7N�+�5:�%�PU�#i��!ry]긕u��y5B��j��:����k|�ݐ8nr��A��o<�6��A��Mc&�j;�]���FӐ�W��6UopYk����9��L���s��m�ޏ�8�>K�"hQ�W�SFZ�|/U���S2�0������-In�[�>h�[{�3���!�z���ၘ��UG�P?��K���Ǎ�����w��A#�u6���?b���\ai�!i�~w݁,H?,7�h�Wm��?뾪�S��4=5��9�Ȅ�J����ͥ���Y���f>3��y�����v�ƞ}�󛇧��['��<�������WoZvwo��!	��� �	�'��I�O?�,�&K��X%��Yq�C��������$��چ�iP�E��{�Tj_M����P�)���{���IS�2�y����js�]��چd��0'�U!�2;��ӻ8���ˬX��E�t���`����qh�M��KE\[G��CV�>��[�����_�s�8s'�Q����6�aN�"��M]L�.k�וF���dx��ճ?���/)M��i^�{���F��8O�_a�ћ��-v�6�4&g�k�M �a��O�N3��4���C�6t�z�F�@��k�k'ұ�<e�Lǣ����0���mb���v��JA���9,��0}{OxIy�g��\��,OL#�����k@9*�
G��#`�U�|J3��z��q�� {\��͌��M�%��~~������w�[M��8�(�4�!�!��8�yvp'j�F��и6�f&G�#Z��� /�c���m���%=җT�jeB$K8���h7�;�j���w<z_jt�^�V($��!�\��|5���/���,|��$,�P�6V��+�V��E�*U:C%�l	\��]H��p]>�8�t���ҥ��r35����a#�G�&y�(��5�}H��s��p�D��,-j ���ZS�O��OMa� \�|�5-�4���]���d����U��هn	.h}.v,������39����A�^����ު�;sO�OW���������N@�ͣ��o ���S����ೈ�Q�o��/{��ܪs�t=��Y�[2j�l��љ���+���1n�Y/�6o�@��dwbz�7 ^� �괍��rTp�FG���
�bc"I�'�vHhI!��J�q�4pG�D%D��m8�
��BB4'��{;^��Z%�0!����L�7zWZN!.<�s�r�JZ�|��Bz���� "︝��"t�����"�2�~X���^�"A.��Z�M��� �@g��]q��b+-��co�Bj����@w8� �Ж��dUXB���;�p�u��:i�9@U�J��F�w��nvB�J���x	��UhJ�V02�1U�A��9�MȠRF�]�J�2ғ��\�`�
Hq�_��L9�j!����"	�kV����p�2=N�Yp�$��A��-�s#���Ƶ	$K�3%�v�a7�F&H��msD"I�C����NwU���V�8���|���%WhC�U�5i��$�"<<��Ѓ8:���c�(x�ѽ����3u)r�>I?h��tAc�m|m�;�y�.]C0�,͌��/X���Vh�Y��Th�y��nm���	�4�ߐ����X����R�����ެ	��iY�F�@7һEK uC�Ӑ�5�نn�j��n���5�M�PsH+6�k��Nb;pQ�k/�����P[����K"��
����6�z��'�B�J4���F�<��~�%H�����|�m��=c8�0��ܜ(7������hi�/0\�A���5�q�5+���$��"�x8H	-y�Nnm�s��!���o�B&����%(&c����vi�Z4�R~�ֆd^Ç p{N�57:���g����?ϊ�ȝ�=='禭�%��o����f��4o�Np��>z�]�2�͜���V�MM�t��v��ƴ�4������4�x�.}g����1�,h,W�Z�EbH�&M5��XE���PFxG�ri��6�T:3�.
ڊ(l��f�F� N  =\������^�D4�s�#Š1�ø+��
w7:3P�Y�/$Iz4^%q8}~q'z���$2x�����������yX�C75��������q������y|�����ׯ.��No6?X�E`�֑v�=�q*��~��՗���+�XE��^��t?M78ɖif���؅���Y���yq����7D�V��82"�քF�bKa�ja�=Ӟ�,pe�bכ2�W�K�����%�/f/T�����N���K��t�ߏ:���\�S%�ޅŕ��2;˳;�݇��3�8'��B�K~X��2�IC�N�ВHg�~����%P%�K���$��y�b�]EC;l���.�~�-I;��]OBP�LiÎo�(}5��o�s�8e��Ӂˤ�Rү]cJ����+K%ɒ���3�~/Q/ڙ5k>(tXY&/ӡ�������i�]0qwW1/*ק|�Oy6�V��S��־͓�.$K�g�O�n�9���g|e���:����:F��V"�^ׁ]X�4�7�
uЊ��w7�B�3���M̝��K �ho%�B�Ap���R��E��R���,��3�����o�+�k�h6?r�B(���5�y�F3�i![�<�H��`�/�y &9���m����$�
�܆���?ڡ��a�4!u*���ɣ(فH͡r^^�B�Qd+2-M��T��~��6��/�������Qr��"���	��W�L.��v�c��n=��cyZ�}�c'r:��y3�F�)U`�9��R����!��Xuu��[�& &�ҊW��b�o����&�İ��J���pܷr��&s���2g�vY��N��w៖�6 ��b��JD�q���Rr��V.�]a2�J�e$)sM�mBmseu�zPܺ���C����,��"�;��}�ʧ�ڗE�$a  \��9����E��z�ҋ�B�|B�\83P�jb "�r(	��׏�ZA)��LY(��Dvr(�����s�&Ŧ�h��lS�q�|�s�bG�D��t�kR�B�C���|EUz��$��|�_<)yJ��8�.�17,��<�����[�xK��7o�?*r}�`�Sw�����WoO�Wo��ɭ�^<���ۄ\oK����j�r��4�_�`�=�� ��iY�c�����&j٩I�<#-����YJ?n�$U����x�7�ۜ���~��^�@<$>�;�ٽo]y�@mzS�֚熻 �R�b3j��*����Z��!���n䱒���\��FJp<�F�=�.'8��A^b�u��| ����Ӱ�V���Bo�
��>TJ��L< ?���'co.O�W�䕨�Ns��t�R���&��c��>a9S��Y���\c�_�w�i���稏�'�	��z8|��u�j�I�'No����PRȫ�=�`�~ͅ���K�w(e �ԗZI�C����X5_�;��d����7���o���j��c��`�.���\�2�ZoE�h�
BouFf�����S-���(^dɈ���i�Xƾ1t��+8}�ه�9�S3�|i%j�������ې�'��oW��Ű7և8�W����ݾ�>��Ut����r��ژl�0M�5��V�@��**K+�M�WFMjw���7��Ԏ.�|,���� ��IJL����ӥ�6�$�)�U����\�(�2d�M��2���y/�%a���f˥�>�6P
��oQ���o���xgՠ�,�׻kk�!�������K�g�+���p?ĵ{ޅq�lOM� W/���!'g>c���z�M��p�u�=�$�B=�jM�Rd���DiĤ2���}3x�/q	��d���w��Kn��L����Y�$�$�{��%9�ݸ���U��_ko%z$Y�P�H�Jg�4gs%��u\� ����)+�G21������nd9%z"&Ef�'G���s��G��盄[�r�Y���0vz����߼�'�w_���O��/N��wϏ����������Oç����w����mo����7����������.?�}����ַ��J�-�)v~�g�Ȗ��ٛw��s�Ͽ�{�R����gG�*��嵴E�N��*Q�.�J��;_��I)sd�"Zj��Z�(,$�g��r7!�@$���fP�����DŊq$^F)�rA<ו_05Fno�7��V�`ӭ���.���N�F:/�����g_���V �A�m[�9���"��og�N:�S� ���_H���80N}(E3�6M��>ni��R�|/*x�+S��}���r$*�B
�T�{�Y�Y-`�I�f��7w�cϣp9ߓ�����[�{N��M�.�̏eW�aa�T%��(0s�rYm�=�`5H2���!��R�C��̲jdn�X��D� :�H�Q`S���`Ǒ(�%�޽��g���b�{s`w4�t�{�m�٫��gԭ|m6���_�Bn�~�����'r�6(�UG+e
C��Q=�P&����)�hA��a)�0�{|����AQ[{�E�"�T�]����&1Ѩ�HzJ�>(����$�}�&ݩ"�)�L�5Z���wC���a���M�i8=�D>k��G�Aw$kx�،����H���*�ǀ��g�X��+���f4Z#5�eflEҢAU���_�w:H)���:�(������3z�u�n���=�7�>�6�O|��0ȝN���I [�59��p�jמ��AZ�KkFy�V��H�I�Y�N���X
{���v����v��{�x�����d��ig��i�D�4O�b0�wv��^�� 9�8�a/T�$�-$�;UL�Ea����lYXܸE,�omc��Ȕ�p�I1}"М�2JV�I�?��o��j���jy���m���Y^|�xsy������5�������w���T      *   �   x�%ͱ1�(�#��D����0��mt�ا�����/C�=*d`��8ȴ6�"5jdYA'�r"�%:�=
����H���	��@���	i���h:���	�ыN�G�ћN�	�G���-:Qz�����z)�      -   �  x����n�0���S��@����YZdC���-��(J��}��4qP���7���'�,Y����5XF��h�4�R��i��:%r���di�fqzg'��dS����(�?Z<Z���M�W4�A���,cv\�Ctj���U�AJ���K.��t����V�VD�o�h}a6���9F��i�� =':e����г�Ҡ����n�� ,/'(�����=�6<XB�/gl��7Q�	�*\�4�QrY����dW����Ҁ�����n���Z �����
,U��+l���KW;Ǘ����TE���=����k0�p/�����PEk�H���$���{���<����#Ҧ�A]b'P�Cq��*&�Q(�g�\FVc��'�7��=Cױ5G:^[A	'zC{T�1T@z�<e[+k��
��ŞZ�W=�����'���Ľ������P��7���H�2�}r3�=�4��Ý�s�c����4�
cK�=u�M�=v�w��;�
ݺc{���1�@�}�t.��=p�%��X�G����z��c/V�����sp6��@p�b����S����]0!��3?@��J�=��u�2VRNF$�D�CP��r��n�.'��_�&��      /   	  x��Xks�6�L��~١��3� �l�v�8M��3�eƲ�P�����lӮ�8���\��xp�+�f�74��D�|��3+)�e�Fz̓����m^�'F���>/�����U5\�U�-w��:wC*�q�ϛ������b���LS��/Zr~���m��x��?��%e?���<l�w�\�ǲ�҇a�0Ve�d�Pj�L�<�ka#ӌQ�$V++A�ڒm�Gc����)��uy=N�����x��]���U�P]]���~h?�v���'��p�X
 ���W�s�:�,rb��%�i�m�z�ݬ���/��f�^��Ӱ6i�����"��%\*ֶ"g��i'c�U�d�tJ?A�F��E��������8��Q:���}||g<�骃�H: �7�E�m���L�3 ,��t��k�[ +�65S�f��1*øRRS�4s	x9>��sv��Uz��͟�͈C��UOE?�S��Mᔑ�/,T1$����ȱ��s�((Z[�C�R~k�� W$c ���B�J���iX�m?�Raͱ�N�8�%/���jᵗT{��4DP�P��q�_��ME��-h���K&S�d�9#Ft`񁞀2 � .y��� 
�|M�H�]M�\X�n�S\q��H�D���p�u\��Ў��9ee?���4���1O���ɫՐw�v��O�C�s2lY��{l���5�6R;�D�^�1 -H�Y��x�S��q9�[�j�v�a���*��ٗ7���UԱ��>�������/�HN�k�q�dw���w��s��n�$��S��3=1-)�p4A�B�(v:%Nia��&^�*<5�E�.6?G��(���u ��@�on�FV
ɢ�@I� @=7	����4�o���gnr�����tQg��#�b{�^k�xt8T��iB�z4���l��G|�vV��t����U��R�q*_�������K��F�� '�(�<v�)���.@c�p�ԇȼ��!+���uЎ~�D������^���5A���4Ѧi�&w��(��Jm֜�ZH��(�ѣ�k����P�br���ɔ��j�@��:�}��о�/aɈV��5"u �,�;^�T*�$�@��"�E`B�<0�] |X+%� u�4�����n=ty���;g�	��T7�rh׹l/���×M(���e�Z�',7\,8+�{#�X�v�Db�u�x�ԡ<Ea��bd�����?�3}���{4.��Zn>3�MX�d���9�c�+Y��U*b$:�_����2��I�Z��kTc������<��?���-��p�ġ�b���j#�lyM������G��ۼ�R�Fu�����9��N�>E�ۻN9��z��pq�}���Ioj_lmi��5�|U$r?�Q��I6Uk�V`КV G'�k�7]�4�#uvY��,���l�&����~\Mi�}s�sPִF�g��"ǌZ0��"�:��B�@Q�(z�:I����jI�uU�0�.�K葷2E�#r�d%zv��lhO�;X5��k��AM)u�D]{g��j¼��fO���v���P��WAn����Uu��Oy��>����E�S�z����\Pi��3/�GMSc��o�e�V��
�řv�|����� �?�B�e�&�(t���2�j�{�:�̣� H�2���~z\���x;a}6��]5#��E���a7\��Qe���|���t���	]���U��\��*ʓ��+��@��-�:k2)�ud¢DQ�҉[�Xjrr�_>ɜڷ�ݛ|�O�Њ��EBX��f��^�I-�XZ����]�F,�#)yn��k��\ZGi��������y�Y����p�j8Nh�z�tש��� 
�@�y��Mo!�3.cu���N�}EF�Q�PC7蠌�A
�*� �u@ $�P���Z���j4��l��BV04�Ŝ4�Msѽ��&�� Tmp��eœPG��;˔}Rʗ�v٬��n;�}oQ�Y�؞�B�tu�.�?^A>�:>{Z���^�ʷ
�W�t�~^�(��o(�z?�^���\a7��Rb1� ��Rf}@��A��fu(��@���쇳����jW�|@=����\��V�V2�o�\��_��-���R_%�h�~�/�?�����>�0�<���>{w����/�Mz���m;�x���?�/����$�����N����j{�oyx~8�����?<z<7���Z�:���_�^�sx�#ewJ��x�^,��\,��b     