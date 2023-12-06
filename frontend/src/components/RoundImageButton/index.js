import React, { useState } from 'react';
import './RoundImageButton.css';

const RoundImageButton = ({ imageUrl, url, onImageUpload, square_id, method }) => {
    const [isLoading, setIsLoading] = useState(false);

    const handleImageUpload = async (e) => {
        if (isLoading) {
            return;
        }

        const file = e.target.files[0];
        if (!file) {
            return;
        }

        setIsLoading(true);

        try {
            const formData = new FormData();
            formData.append('image', file);
            if (square_id){
                formData.append('square_id', square_id);
            }

            const response = await fetch(url, {
                method: method,
                body: formData,
            });

            const responseData = await response.json();

            if (responseData.result !== false && responseData.data !== null) {
                if (responseData.data.square_id){
                    onImageUpload(responseData.data.square_image, responseData.data.square_id);
                }else{
                    onImageUpload(responseData.data.background_image);
                }
            } else {
                console.error('Erro ao fazer upload da imagem');
            }
        } catch (error) {
            console.error('Erro na solicitação:', error);
        } finally {
            setIsLoading(false);
        }
    };

    return (
        <label className="round-image-button" id={square_id} style={{ backgroundImage: `url(${imageUrl})` }}>
            {isLoading ? 'Aguarde...' : <input type="file" onChange={handleImageUpload} />}
        </label>
    );
};

export default RoundImageButton;
